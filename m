Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F14643D851B
	for <lists+freedreno@lfdr.de>; Wed, 28 Jul 2021 03:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E556EC38;
	Wed, 28 Jul 2021 01:03:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DCD6EC1D;
 Wed, 28 Jul 2021 01:02:53 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so7515866pjb.0; 
 Tue, 27 Jul 2021 18:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
 b=mKsL6bQdL5LxaaCFnf0O4WfONIQ8TCt4jpcZUmVWJ/LrvH+HSsEuvpQWzOTXQQBAgP
 YJgnR9KJ/Zw0toXptUtcS0T+FQEIzkSr6dQkIeoG7qloDVKNer1AjElHpghoOFol96HM
 tzVi5MOCkQ0047mzoiN9FmwgLOPTsX1/dVmtf0fJl6hCUT1Ikzvz7HApAkNh6KvGOy1t
 22L633eR/RKJbSlJroMlFxN1ytNvPdzNKD/jS1vjk26MQKRQGdOPvFZBlq4UcBY28jCq
 1HwAlhh39lkiY7wtLrwER5lbHZqJJMrDrAFx0ji4PNbAv5KwEWt5djAR1TBthI3KNJxA
 mu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
 b=KqQXKskSjBz/XWIfmCsw3Uu10asG37bdZkfh3siFDhQVWWGc7CTBWzRddZDGG0Clxe
 R471YfRUtB+Vu859Epe6CbMdD5pIgYJ+5n3t8OoByXEDcOB4jqGczAyyWEakbHKxp7dS
 8PQ88qOrIFcO1YhaV8m2NHnbmKsZRZIGq+wBtVVv9ocUt22KkDGkiDHy2UM+++t7kaCk
 XSUdNbnOzomXzlFaQrhCoFepDLZrRdzjd5UTLAXPdjx6g2PUnEvSDJwDW77TBJh9fJBQ
 n/KojxeQCrs0Wyu/8GPpk2ZvB77kBLJ3urRWYToISPYRNXQ6yegxuiM9rXHYmgNkxXZN
 mbIA==
X-Gm-Message-State: AOAM531WTqGzygPsOGEkGXnE0/nOBwEhUER8ypEfUM91Xw1vYWTIIvmI
 UUiZtTfe58uFXMDt6laGm6a/DZvyOKMm0Q==
X-Google-Smtp-Source: ABdhPJwyyI6l0r5SszrnRnJ+PmeqwvWRyFs2gHZiaNFXqCHoj3lXlSdMxUwHFEqWpRPgVqJO/wn5YQ==
X-Received: by 2002:a62:8407:0:b029:39a:59dc:a237 with SMTP id
 k7-20020a6284070000b029039a59dca237mr11938158pfd.30.1627434172947; 
 Tue, 27 Jul 2021 18:02:52 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 y2sm4987021pfe.146.2021.07.27.18.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:02:51 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 27 Jul 2021 18:06:13 -0700
Message-Id: <20210728010632.2633470-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 08/13] drm/msm: Return ERR_PTR() from
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>,
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
