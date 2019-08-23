Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537289A8E9
	for <lists+freedreno@lfdr.de>; Fri, 23 Aug 2019 09:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF856EBCC;
	Fri, 23 Aug 2019 07:34:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFE26EBCC
 for <freedreno@lists.freedesktop.org>; Fri, 23 Aug 2019 07:34:58 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t14so7974963lji.4
 for <freedreno@lists.freedesktop.org>; Fri, 23 Aug 2019 00:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tWhyqZI+RyxZp+FLk4Dgae8z/RXq1pkybZ7Bwrb+ZCM=;
 b=KrSNKzW5cm1PJhb+WNY+MlDZpI/w+h+aAFDhPiN5utbYkPBIx+QSRy8ogk/SRZka9b
 E8bLYIpRZGOEkzm8hbo9/lWLspNZp4epKvQ0S+e9OZfBch6Tvxe/f8duL9dtmOoJs6GO
 I9H/hI34Oz8l2kxqG4HaAwkRmEjoUEsfZz6akjF1j3Tk5kzl1QTqKSeQQRtxCEDMUS1B
 WRFpjRTYNb0hEMxsphngdCTKuvaxtsSXwuGT13bzHRwV0SEqnzgueU6Lmk8OQNF5gMxw
 AFacKNTWF0Y3Q9LWtdRU+geIHnVbGKS6DoPYdJYSTOIxYN6c5ONKSsE5IgKg0XvQbke6
 9CtA==
X-Gm-Message-State: APjAAAXeAARNC9Kc1/MowrWqvkTCB2aSOU/Tiq5WUWEDZWWjQROekgmM
 gDrq57+zDV/3X9YMN48sUuTipw==
X-Google-Smtp-Source: APXvYqwE7u2Cs/tTCozVbGiGnJ7iMpM+OrgYgkUfeZIdWWR0fNMzgWHa/Qd+FYH1ykVSS4a9eQpqHA==
X-Received: by 2002:a2e:914c:: with SMTP id q12mr2052131ljg.34.1566545696789; 
 Fri, 23 Aug 2019 00:34:56 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id n7sm483780ljh.2.2019.08.23.00.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:34:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Date: Fri, 23 Aug 2019 09:34:44 +0200
Message-Id: <20190823073448.8385-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823073448.8385-1-linus.walleij@linaro.org>
References: <20190823073448.8385-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tWhyqZI+RyxZp+FLk4Dgae8z/RXq1pkybZ7Bwrb+ZCM=;
 b=iZWqkN2xUIjsY5VbuNfnpVbnLrR2fvQe/6iNNcrdauqIWg8r7Lk9WFj1khRph5byLA
 6RwOND0kiZNLX9/QXicq6PnTD0NyE7i2/icCnxLNy9dEW/MBWvqtrsMUWqYAXDaau8Ee
 McR3meUDHDe+NB+ZypD2E0zMsvAH2BYeZRjT86W6EtOyasq0OyPz1Hzj0u8s/2flH8gb
 TYakAXyFno2/OQgZMgVPPaNaDw+db76oJBcTJC9J+Q5lF88aKm6W0dktNQ4AtSgeeaZH
 IdMwt0tQzKHa7611JHWfdn40qS8MRaCeVqMtrDxRolM1hawqxFWbc6MT7SiIp+a9Srnx
 7Rzw==
Subject: [Freedreno] [PATCH 2/6 v2] drm/msm/dsi: Drop unused GPIO includes
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VGhpcyBEU0kgZHJpdmVyIHVzZXMgdGhlIG5ldyBkZXNjcmlwdG9yIEFQSSBzbyB0aGVzZSBvbGQK
R1BJTyBBUEkgaW5jbHVkZXMgYXJlIHN1cnBsdXMuCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtA
Z21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0t
bXNtQHZnZXIua2VybmVsLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpS
ZXZpZXdlZC1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+ClNpZ25lZC1v
ZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCkNoYW5n
ZUxvZyB2MS0+djI6Ci0gUmViYXNlZCBvbiB2NS4zLXJjMQotIENvbGxlY3RlZCByZXZpZXcgdGFn
Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyB8IDIgLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL2RzaV9ob3N0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCmluZGV4
IGFhMzVkMThhYjQzYy4uNGI2ZjYyMTM4MzkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2RzaS9kc2lfaG9zdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0
LmMKQEAgLTYsMTEgKzYsOSBAQAogI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgogI2luY2x1ZGUgPGxp
bnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+Ci0jaW5jbHVkZSA8bGludXgvZ3Bp
by5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9p
bnRlcnJ1cHQuaD4KICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KLSNpbmNsdWRlIDxsaW51
eC9vZl9ncGlvLmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+CiAjaW5jbHVkZSA8bGludXgv
cGluY3RybC9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+Ci0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVk
cmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
