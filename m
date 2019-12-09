Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0139E117777
	for <lists+freedreno@lfdr.de>; Mon,  9 Dec 2019 21:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EE0899D6;
	Mon,  9 Dec 2019 20:32:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB77899D6;
 Mon,  9 Dec 2019 20:32:40 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id d62so7577557oia.11;
 Mon, 09 Dec 2019 12:32:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcDMXx7JLbsJ2UCoZNJKLtfB+ZkWm+OkWxKRuqwbsNs=;
 b=h3AkFUGNi2LfqhBHtDWQ/xZjxVPGnpyh78exf64XWWhn1RhzwHyseEgsalq6KuayCV
 XogylTGpQ9evJ8RlCgP7pUk4OvJ6pO3yZhDla955syUOpozNn7vfnm5xjvhd98AQ9UjJ
 waoGtJX5pHWim1Xi26EYQDUWGC2FTYn1ZEYJaHYRRr5IhRBId3nEOzpfTx4HK5DGrmpz
 PEV9Yu6fKPM9adngSPbK+dzW5PUjHnxomaiWkzKy7F2pzrSedlvVgsXmi9guqX8jwV6D
 m0o/mMCSDxymLUiLo1Btisn32XTgsAnviBjI1+xL56SOCbDw5yOSLEuhdf4G0+XE4xOk
 oX7Q==
X-Gm-Message-State: APjAAAVGrCkh7Kf8GCwnygE3Dr7USGQojI1tAdyHqTS0x9gOkNTwFerr
 qIlLkuds27zp8OpOKCcA/yg=
X-Google-Smtp-Source: APXvYqwQiJRdqznvLkCjZMRsuRjsUdi2zEVecgF+rxwnBIHpEw9DLBMn1AR7VjFqiDCXnvZTVFexsg==
X-Received: by 2002:aca:570f:: with SMTP id l15mr917514oib.120.1575923559992; 
 Mon, 09 Dec 2019 12:32:39 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id f3sm368332oto.57.2019.12.09.12.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 12:32:39 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Date: Mon,  9 Dec 2019 13:32:30 -0700
Message-Id: <20191209203230.1593-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcDMXx7JLbsJ2UCoZNJKLtfB+ZkWm+OkWxKRuqwbsNs=;
 b=ii5EIKHBMaUVjEe/pz16DIxXm7wIOI19PiJzZ/jRWPQdu6FJoVjJ0CDB9uIbNL4bhT
 B+rmUwsjdnM2DJtFKideItEvY2CMBK4T3nHz780Don2HA/9AaYPso9dyQbR5SUcHq3JX
 DNgFjgLNLcjaMR44m6YmsQZWcYZ+y8sobtakx0B+rV8O9haEKPhcG+p0HcED+hMfw42b
 2Ci7tVAleD761wJTbclrhtNiWcs1HAkGMLdIOXbXzYElCdYa3Z8DM9A4XPGaD8On7uqS
 th3RknfkyGEL09MbE6gt382YWYtvPpxrUVO0vcp8hRazfg5L+22guUXO3hfiasrzmIHZ
 aVqw==
Subject: [Freedreno] [PATCH] drm: msm: mdp4: Adjust indentation in
 mdp4_dsi_encoder_enable
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Q2xhbmcgd2FybnM6CgouLi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2RzaV9l
bmNvZGVyLmM6MTI0OjM6IHdhcm5pbmc6Cm1pc2xlYWRpbmcgaW5kZW50YXRpb247IHN0YXRlbWVu
dCBpcyBub3QgcGFydCBvZiB0aGUgcHJldmlvdXMgJ2lmJwpbLVdtaXNsZWFkaW5nLWluZGVudGF0
aW9uXQogICAgICAgICBtZHA0X2NydGNfc2V0X2NvbmZpZyhlbmNvZGVyLT5jcnRjLAogICAgICAg
ICBeCi4uL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA0L21kcDRfZHNpX2VuY29kZXIuYzox
MjE6Mjogbm90ZToKcHJldmlvdXMgc3RhdGVtZW50IGlzIGhlcmUKICAgICAgICBpZiAobWRwNF9k
c2lfZW5jb2Rlci0+ZW5hYmxlZCkKICAgICAgICBeCgpUaGlzIHdhcm5pbmcgb2NjdXJzIGJlY2F1
c2UgdGhlcmUgaXMgYSBzcGFjZSBhZnRlciB0aGUgdGFiIG9uIHRoaXMgbGluZS4KUmVtb3ZlIGl0
IHNvIHRoYXQgdGhlIGluZGVudGF0aW9uIGlzIGNvbnNpc3RlbnQgd2l0aCB0aGUgTGludXgga2Vy
bmVsCmNvZGluZyBzdHlsZSBhbmQgY2xhbmcgbm8gbG9uZ2VyIHdhcm5zLgoKRml4ZXM6IDc3NjYz
OGU3M2ExOSAoImRybS9tc20vZHNpOiBBZGQgYSBtZHA0IGVuY29kZXIgZm9yIERTSSIpCkxpbms6
IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzc5MgpTaWdu
ZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA0L21kcDRfZHNpX2VuY29kZXIuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA0L21kcDRfZHNpX2VuY29kZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA0L21kcDRfZHNpX2VuY29kZXIuYwppbmRleCA3
NzJmMDc1M2VkMzguLmFhZjJmMjZmODUwNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL21kcDQvbWRwNF9kc2lfZW5jb2Rlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9tZHA0L21kcDRfZHNpX2VuY29kZXIuYwpAQCAtMTIxLDcgKzEyMSw3IEBAIHN0YXRpYyB2
b2lkIG1kcDRfZHNpX2VuY29kZXJfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikK
IAlpZiAobWRwNF9kc2lfZW5jb2Rlci0+ZW5hYmxlZCkKIAkJcmV0dXJuOwogCi0JIG1kcDRfY3J0
Y19zZXRfY29uZmlnKGVuY29kZXItPmNydGMsCisJbWRwNF9jcnRjX3NldF9jb25maWcoZW5jb2Rl
ci0+Y3J0YywKIAkJCU1EUDRfRE1BX0NPTkZJR19QQUNLX0FMSUdOX01TQiB8CiAJCQlNRFA0X0RN
QV9DT05GSUdfREVGTEtSX0VOIHwKIAkJCU1EUDRfRE1BX0NPTkZJR19ESVRIRVJfRU4gfAotLSAK
Mi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpG
cmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
