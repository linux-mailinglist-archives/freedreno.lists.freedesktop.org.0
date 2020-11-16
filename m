Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D242B4DAD
	for <lists+freedreno@lfdr.de>; Mon, 16 Nov 2020 18:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C976789FED;
	Mon, 16 Nov 2020 17:41:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962A06E9F3
 for <freedreno@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l1so19644888wrb.9
 for <freedreno@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tTwQDvBtnpWbM0srw/EUqdspNhCuLlcukla9ix/INuQ=;
 b=g4UiDscwY/1oIPlgmGmNSmsyprgvCPP0mfkN+jRO3SE5cBqae6RaGAR9IUaPSZUxof
 j13OCWwzarpHIiVkv/lCvijBftpfBu3CfwV0uAjtOACmRqUmmVRJlu1hHjjaEbDQlhau
 I3K2FUugZPw1tr7zsOT1+KjOpoBTufXi3dq7ToTrVwC/NOrUntqtEDSpKQ+AMfuu02b+
 IHC2wQjp7Zo7nwOPGEe5P34uAZNk9FrdMb1xYPUHtFbeTil2AN3lzicyIi1JXHzEphOm
 MHsyCNW6VNsOf4OCewOVHOGuHu2VVqA3RsBCJbEMA5lv0zhTazg/R/MSD/z2Av9RU94p
 3YxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tTwQDvBtnpWbM0srw/EUqdspNhCuLlcukla9ix/INuQ=;
 b=kL0AvJ0w/3TikwcrwA6532pzw4Yn/rUUmb1YwkZk0kbKdgt7PpLqAEQiNsNwgwrj5v
 aLfg7nB60ao3wpgWHDYchqbc1FOBHl0bjG9vce03Se6FdBAsoyBLN0H+7gjYZZLVAaMn
 a3V0q9YcpovANUGaHg5yyk5a4hciZ7Xm4pQZFQ40aUHjJGGtdrUigFL86+nyOilB6HJ+
 LXGzfIcEEjwM5paUPbZGLHI4oJe2En+IiQ5UzfUqi8GzdV4CljRTfTabl5gnLtFLLrp8
 TpxSAZTckeaNIlWt+V9ivpJB6RXuuCKLFccGQ3NRQjM+BBleagOAOsoQxneMXI9LODiZ
 zw/A==
X-Gm-Message-State: AOAM532MoUubUC3/JbYBiyVNhlBWZIjZce3cLvbK4P3ZFhyvNyb0e8rA
 U7r2CwA9maxGZM+0Mu605YjfYw==
X-Google-Smtp-Source: ABdhPJyNP2NVhgTiLMxWbWxmQP47XGLeaZhP7nL1I8MHMwAmQ8wJVsvtnCWCCTWN8bCCxgCJTJY0tw==
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr20442206wrv.258.1605548500288; 
 Mon, 16 Nov 2020 09:41:40 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:39 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Mon, 16 Nov 2020 17:40:45 +0000
Message-Id: <20201116174112.1833368-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 15/42] drm/msm/adreno/a6xx_gpu: Staticise local
 function 'a6xx_idle'
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYzozMzo2OiB3YXJuaW5nOiBubyBwcmV2aW91
cyBwcm90b3R5cGUgZm9yIOKAmGE2eHhfaWRsZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpD
YzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBv
b3JseS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9y
ZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZnJlZWRyZW5vQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYwppbmRleCBmY2IwYWFiYmM5ODUyLi4wM2MyZjdlMGM5
NDk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMKQEAgLTMwLDcgKzMwLDcg
QEAgc3RhdGljIGlubGluZSBib29sIF9hNnh4X2NoZWNrX2lkbGUoc3RydWN0IG1zbV9ncHUgKmdw
dSkKIAkJQTZYWF9SQkJNX0lOVF8wX01BU0tfUkJCTV9IQU5HX0RFVEVDVCk7CiB9CiAKLWJvb2wg
YTZ4eF9pZGxlKHN0cnVjdCBtc21fZ3B1ICpncHUsIHN0cnVjdCBtc21fcmluZ2J1ZmZlciAqcmlu
ZykKK3N0YXRpYyBib29sIGE2eHhfaWRsZShzdHJ1Y3QgbXNtX2dwdSAqZ3B1LCBzdHJ1Y3QgbXNt
X3JpbmdidWZmZXIgKnJpbmcpCiB7CiAJLyogd2FpdCBmb3IgQ1AgdG8gZHJhaW4gcmluZ2J1ZmZl
cjogKi8KIAlpZiAoIWFkcmVub19pZGxlKGdwdSwgcmluZykpCi0tIAoyLjI1LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5n
IGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
