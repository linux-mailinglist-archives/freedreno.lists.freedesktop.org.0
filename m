Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B58A2B1C2A
	for <lists+freedreno@lfdr.de>; Fri, 13 Nov 2020 14:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C8B6E520;
	Fri, 13 Nov 2020 13:49:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5F46E520
 for <freedreno@lists.freedesktop.org>; Fri, 13 Nov 2020 13:49:51 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a3so8545639wmb.5
 for <freedreno@lists.freedesktop.org>; Fri, 13 Nov 2020 05:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tTwQDvBtnpWbM0srw/EUqdspNhCuLlcukla9ix/INuQ=;
 b=qrvSVoup3n8u8pYQhoQWokhMcBFhpiN8nyF8qI0HnXLJQlB3KuihkzMOb9FuMYyNKC
 Kwj2BDP1Qxst46LBOeu4iGuvzAo6b7i+r6auLDVQmLv5NWVIfKerRhDn/m21fMAn3nmj
 zcBFB3BAmgebJUsvaamTnF/gmJIY7uP3vEWpNG94/YecvIyHFnYNK0fchgmJcb/79T+g
 FABDe/gxMs5OwehhsHSkiX0/0yrHrd23HLfP36heprsQXK4kWsw5Tzviqg0r1Q3iRi0n
 rr3FS4f6gFsuvX+xsiobwmul2yiHCGgjSYXFlt8grMLJoxtiWDWJRAMm/JXjlfWJaD9E
 2ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tTwQDvBtnpWbM0srw/EUqdspNhCuLlcukla9ix/INuQ=;
 b=ttpxsGo36ZgpXEyMkf6xOSMxzgS2zMhxUEPyy6lWKZNRYxrF/LcAU/DdopHKYPAvF9
 zWsu8xN5eTtGJwgQCaL7f9EQ4f4nx0OqgYriw0rsGi+xSjK22hARVCkVqfwZKUWsRliw
 tRoqWxHSmPDwAd07U87xpb8+x+yszXugNQztM/eaVrSz1VX4pOh17+HY+hJkR51yP7Ju
 0FbKccHSdBBv+HxfJ/oEXhiJZJljn7eotq0WYZUxg503W2dhKA9vus/9KItAVrMPkT27
 3ejZ+AOdVvRnsu3AdXLKP64fvehl0wHTUNp5XSzmPvUVhWkJE+Kv2e+fyGX/GhSDeLNt
 qkXw==
X-Gm-Message-State: AOAM533Lu2yyKPMPUASiS1c2ir2+rviXdyIgMKPC/z3v4KzGQgfOpa+v
 NbpOQfrnB1rHgt4s5wnDmDaVng==
X-Google-Smtp-Source: ABdhPJxYu/+Qfz9qKiqyhGPZDZs5SaWMLz8YE94+9v1Zkz2nvsz0yFKLHotBNMpb1aJZChOAMHP7JA==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr2620978wmj.76.1605275389843;
 Fri, 13 Nov 2020 05:49:49 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:49 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 13 Nov 2020 13:49:04 +0000
Message-Id: <20201113134938.4004947-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 06/40] drm/msm/adreno/a6xx_gpu: Staticise local
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
