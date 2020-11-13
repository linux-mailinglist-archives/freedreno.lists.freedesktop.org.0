Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4518F2B1C3F
	for <lists+freedreno@lfdr.de>; Fri, 13 Nov 2020 14:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24ACD6E520;
	Fri, 13 Nov 2020 13:50:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2E16E520
 for <freedreno@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:26 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c17so9948375wrc.11
 for <freedreno@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B874/wtDOWYUimH8rXUdl9sC7ZHgpAhfTu7itpIsNws=;
 b=FYPms3ZCfPub5iaespY6VDZIg/UmY32Kvxev64zmWZOrrM4041a5OdDqUOv0kfH8AR
 3C7hNCP7cHZ0v/h4e+8cnFjaoPM8bPL36QaZW1kHFqKjLzsUm9UKnD/r5GWAm4pm2JPF
 m5GQZ7E6qKCbUWYUxZW5hhW5RsOh+iJOedQtBtLS26vz4XNap9+BnUufDta+Z+wuno/e
 cezrhZqtIg08ewYF3AS7M96FkeJ4tPgEl4A+tx5pyJ207sxO1w/43KMcuKFKdyaKLigI
 6i9UleZKkZeYOU5nKl8O3JdsOZp+ZshJ7jnDF06QFnQyRtCjg1Swf0tfrvn0v6E8IYaH
 nyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B874/wtDOWYUimH8rXUdl9sC7ZHgpAhfTu7itpIsNws=;
 b=VcEUtm7TXYhpszySZQOV2xTJFNK3ypdp5xBFjMsUJY85EmagLCdn2kx+/L35Dyb3QS
 7I/PecrL7k6Ls0U4B7IwymGiWUGvxNnjIzX6Epst6Rm+/U7JJqSpbIeM98jo9TVTZMxV
 s5dMpbdLQFBp1Max5DmR0eKN8H87FvHk1FF87NOV17gkVmT8jHSRXNvrqx+J6rPChcNB
 kVC2sPYy2dEQQqRGs7fdMh/6sB0eWT5RZY1vm8Zc6kT6+l7kjRzza7/NLF/QiFBf4h02
 G76SLOG14Cs0rjPgVL5wzaALtuFMJuVEp6u8QV2x+ND3Lx+DxmNpYvvwOjlbi4MA4U+7
 w0xg==
X-Gm-Message-State: AOAM530ksQ962vVKR3jtdkeXgag28TbRrInQmj+bos8iQXMhzQ/m9BeQ
 yTDGnaKPMKByhRjyfgpaJGnYqw==
X-Google-Smtp-Source: ABdhPJzW0/tqfdT3UV2hYFMEgBNeQqVvBSA0yd4n3Fg74iGLfPp9MOAfA0L9PQmK+LV0ocjfEq32/A==
X-Received: by 2002:adf:fb0f:: with SMTP id c15mr3487064wrr.86.1605275425504; 
 Fri, 13 Nov 2020 05:50:25 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:24 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 13 Nov 2020 13:49:33 +0000
Message-Id: <20201113134938.4004947-36-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 35/40] drm/msm/disp/mdp5/mdp5_kms: Make local
 functions 'mdp5_{en, dis}able()' static
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYzoyOTk6NTogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhtZHA1X2Rpc2FibGXigJkgWy1XbWlzc2luZy1wcm90b3R5
cGVzXQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYzozMTk6NTogd2Fy
bmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhtZHA1X2VuYWJsZeKAmSBbLVdtaXNz
aW5nLXByb3RvdHlwZXNdCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzog
U2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJu
ZWwub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBmcmVlZHJlbm9A
bGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVz
QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMu
YyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5j
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwppbmRleCBiM2VlY2Y4
Njk0NzcxLi4xNWFlZDQ1MDIyYmM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvbWRwNS9tZHA1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21k
cDVfa21zLmMKQEAgLTI5Niw3ICsyOTYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1kcF9rbXNf
ZnVuY3Mga21zX2Z1bmNzID0gewogCS5zZXRfaXJxbWFzayAgICAgICAgID0gbWRwNV9zZXRfaXJx
bWFzaywKIH07CiAKLWludCBtZHA1X2Rpc2FibGUoc3RydWN0IG1kcDVfa21zICptZHA1X2ttcykK
K3N0YXRpYyBpbnQgbWRwNV9kaXNhYmxlKHN0cnVjdCBtZHA1X2ttcyAqbWRwNV9rbXMpCiB7CiAJ
REJHKCIiKTsKIApAQCAtMzE2LDcgKzMxNiw3IEBAIGludCBtZHA1X2Rpc2FibGUoc3RydWN0IG1k
cDVfa21zICptZHA1X2ttcykKIAlyZXR1cm4gMDsKIH0KIAotaW50IG1kcDVfZW5hYmxlKHN0cnVj
dCBtZHA1X2ttcyAqbWRwNV9rbXMpCitzdGF0aWMgaW50IG1kcDVfZW5hYmxlKHN0cnVjdCBtZHA1
X2ttcyAqbWRwNV9rbXMpCiB7CiAJREJHKCIiKTsKIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0
CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
