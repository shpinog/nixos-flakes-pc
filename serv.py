import socket

def wake_on_lan(mac_address, router_ip='192.168.4.1', target_ip='192.168.4.77', port=9):
    try:
        # Очистка MAC-адреса
        mac_address = mac_address.replace(':', '').replace('-', '')
        
        # Преобразование MAC в байты
        mac_bytes = bytes.fromhex(mac_address)
        
        # Создание Magic Packet
        magic_packet = b'\xff' * 6 + mac_bytes * 16
        
        # Создание UDP-сокета
        with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as sock:
            # Разрешение широковещательной передачи
            sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
            
            # Отправка на IP роутера
            sock.sendto(magic_packet, (router_ip, port))
        
        print(f"Magic Packet успешно отправлен")
        print(f"MAC адрес: {mac_address}")
        print(f"Целевой IP: {target_ip}")
        print(f"IP роутера: {router_ip}")
        return True
    
    except Exception as e:
        print(f"Ошибка: {e}")
        return False

# MAC-адрес компьютера, который нужно включить
mac_address = "d4:5d:64:ed:af:0c"

wake_on_lan(mac_address)
