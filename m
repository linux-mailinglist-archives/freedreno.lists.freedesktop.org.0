Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49B63D7BB8
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 19:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9056EB6B;
	Tue, 27 Jul 2021 17:08:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBA46EB6B;
 Tue, 27 Jul 2021 17:08:00 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d1so9233666pll.1;
 Tue, 27 Jul 2021 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
 b=jcAcwqstEOR4qb2BBinVCKD2vK40zabAZDobs9CGw7oA0B5/Uo39Z8U/TunA0JlJn9
 PgtSMUxc3TFLH+bNRf3LoMD/b0Ov9elpRdAEVvE+bo1kIf3MiQmjXoVrgQD3oDYA8snQ
 V9kcUqbchW1v5HSVS3WAzg8gbrak2eH2NjUrA+VThTFFA7VZyixQSKweVYFbWWHw0zmw
 3UcYs687WnarE+QTYAJmLNwe49yEHjKJ0W4VyauHl3XxKYGFyWAK1IHKM5GPo4n04quA
 ey1/UDfC8nxgG4iZpDmuK7iqD5hqwVZhhpvwma6zBE5s3RRRf+45j6bc46JCcxICt+Gd
 r0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
 b=MCWBDaq3RbJAjK2oU4SqXpAUvtBL1gl8RrRFl/sLLCmegs9nbAG+UPJpVIg0wEctRF
 FMg9VK5IdQ6fJNCsniwVnNSsqUJbd1GtKSyFlPynDamZL3J1GcHKPu/ojBallvTsupIn
 o0oI3siwZJM5RruJsXGZJiIafTXrherWf7nIIiat4B1xEV9Im7UFe+EQSqJFVsNJJiQz
 axHYmu3RsoW7gDIhG55zRF1n21to6LVU9ZREim7Zvp6EWoIwMznTjAcHtiED7KzMqtsk
 7/sRJTUXYQ63jWDXxjy8dN9al/4zM8G3xQuCT/Z5+nyg9l7u79MnKx93UkdWY1T1acsA
 D03Q==
X-Gm-Message-State: AOAM533bKmV+Jn3FZLErcz4+Eb9umlHVqL4VlrZC0R7JQaOA/wtCpcOk
 EH16dTI8nOyyJSuY6hpDZEzaoZC16gSLFA==
X-Google-Smtp-Source: ABdhPJxkOfEy8AbqJGKBlgeO6CURUUgvuSIA2rG71cqgzXXY47ElwdZIc4XFSetnPwkigt1ALvNlTA==
X-Received: by 2002:a17:90b:3754:: with SMTP id
 ne20mr5224240pjb.74.1627405679659; 
 Tue, 27 Jul 2021 10:07:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id 33sm4978462pgs.59.2021.07.27.10.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:07:58 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 27 Jul 2021 10:11:24 -0700
Message-Id: <20210727171143.2549475-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 08/13] drm/msm: Return ERR_PTR() from
 submit_create()
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKSW4gdGhlIG5leHQgcGF0
Y2gsIHdlIHN0YXJ0IGhhdmluZyBtb3JlIHRoYW4gYSBzaW5nbGUgcG90ZW50aWFsIGZhaWx1cmUK
cmVhc29uLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3Jn
PgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zdWJtaXQuYyB8IDIxICsrKysrKysrKy0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3N1Ym1pdC5jIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3N1Ym1pdC5jCmluZGV4IGY2ZjU5NWFhZTJjNS4u
ZjU3MDE1NWJjMDg2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3Vi
bWl0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3N1Ym1pdC5jCkBAIC0zMiwz
MCArMzIsMjcgQEAgc3RhdGljIHN0cnVjdCBtc21fZ2VtX3N1Ym1pdCAqc3VibWl0X2NyZWF0ZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQl1aW50MzJfdCBucl9jbWRzKQogewogCXN0cnVjdCBt
c21fZ2VtX3N1Ym1pdCAqc3VibWl0OwotCXVpbnQ2NF90IHN6ID0gc3RydWN0X3NpemUoc3VibWl0
LCBib3MsIG5yX2JvcykgKwotCQkJCSAgKCh1NjQpbnJfY21kcyAqIHNpemVvZihzdWJtaXQtPmNt
ZFswXSkpOworCXVpbnQ2NF90IHN6OworCisJc3ogPSBzdHJ1Y3Rfc2l6ZShzdWJtaXQsIGJvcywg
bnJfYm9zKSArCisJCQkoKHU2NClucl9jbWRzICogc2l6ZW9mKHN1Ym1pdC0+Y21kWzBdKSk7CiAK
IAlpZiAoc3ogPiBTSVpFX01BWCkKLQkJcmV0dXJuIE5VTEw7CisJCXJldHVybiBFUlJfUFRSKC1F
Tk9NRU0pOwogCi0Jc3VibWl0ID0ga21hbGxvYyhzeiwgR0ZQX0tFUk5FTCB8IF9fR0ZQX05PV0FS
TiB8IF9fR0ZQX05PUkVUUlkpOworCXN1Ym1pdCA9IGt6YWxsb2Moc3osIEdGUF9LRVJORUwgfCBf
X0dGUF9OT1dBUk4gfCBfX0dGUF9OT1JFVFJZKTsKIAlpZiAoIXN1Ym1pdCkKLQkJcmV0dXJuIE5V
TEw7CisJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwogCiAJa3JlZl9pbml0KCZzdWJtaXQtPnJl
Zik7CiAJc3VibWl0LT5kZXYgPSBkZXY7CiAJc3VibWl0LT5hc3BhY2UgPSBxdWV1ZS0+Y3R4LT5h
c3BhY2U7CiAJc3VibWl0LT5ncHUgPSBncHU7Ci0Jc3VibWl0LT5mZW5jZSA9IE5VTEw7CiAJc3Vi
bWl0LT5jbWQgPSAodm9pZCAqKSZzdWJtaXQtPmJvc1tucl9ib3NdOwogCXN1Ym1pdC0+cXVldWUg
PSBxdWV1ZTsKIAlzdWJtaXQtPnJpbmcgPSBncHUtPnJiW3F1ZXVlLT5wcmlvXTsKIAlzdWJtaXQt
PmZhdWx0X2R1bXBlZCA9IGZhbHNlOwogCi0JLyogaW5pdGlhbGx5LCB1bnRpbCBjb3B5X2Zyb21f
dXNlcigpIGFuZCBibyBsb29rdXAgc3VjY2VlZHM6ICovCi0Jc3VibWl0LT5ucl9ib3MgPSAwOwot
CXN1Ym1pdC0+bnJfY21kcyA9IDA7Ci0KIAlJTklUX0xJU1RfSEVBRCgmc3VibWl0LT5ub2RlKTsK
IAlJTklUX0xJU1RfSEVBRCgmc3VibWl0LT5ib19saXN0KTsKIApAQCAtNzk5LDggKzc5Niw4IEBA
IGludCBtc21faW9jdGxfZ2VtX3N1Ym1pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLAogCiAJc3VibWl0ID0gc3VibWl0X2NyZWF0ZShkZXYsIGdwdSwgcXVldWUsIGFyZ3MtPm5y
X2JvcywKIAkJYXJncy0+bnJfY21kcyk7Ci0JaWYgKCFzdWJtaXQpIHsKLQkJcmV0ID0gLUVOT01F
TTsKKwlpZiAoSVNfRVJSKHN1Ym1pdCkpIHsKKwkJcmV0ID0gUFRSX0VSUihzdWJtaXQpOwogCQln
b3RvIG91dF91bmxvY2s7CiAJfQogCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5v
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
