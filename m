Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5215E2C0428
	for <lists+freedreno@lfdr.de>; Mon, 23 Nov 2020 12:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841666E02C;
	Mon, 23 Nov 2020 11:20:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7EA89FC9
 for <freedreno@lists.freedesktop.org>; Mon, 23 Nov 2020 11:20:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r17so18257108wrw.1
 for <freedreno@lists.freedesktop.org>; Mon, 23 Nov 2020 03:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3XQiSvdHNX/l8zTX1wnsdbanAAcRSnCZFK2InbUgz80=;
 b=ITMcw66kMNj6+a35t560vvLEJp9Qh3wX0OAmVSouJIPLLOsp/LcrYRXMqRiNL1IzWp
 N88RAF/OA4LP2xGceSDMEdHSP4NCSNn2TSIa0J52t70m0+Cd5Jd5qhoE/KLjniNY96Du
 CEvjpeHeTWD7XQHNXEmghRGM3nQKcrWOIa0NHPPChpU0y7QnN4rLW1ESzUI0kG2lNCsk
 L/FNUM/285Cq7SZpdjddlkjFfHPPQV3ZKYnfwp4fh//vsODzAD4+0ePc8TkDFkGMZaPl
 dpKkd1zjRHALp6PHoTEqjG2Nt7KRy4F4csBhN90NqRTLGFbhiEeIGjVPQO9wWpcoy6jh
 eW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3XQiSvdHNX/l8zTX1wnsdbanAAcRSnCZFK2InbUgz80=;
 b=E0x842tb+KSkHXLmy0EY1VnS98lf/gKt6TXcf0pf6APAqLaPTjCyKlNMigbjN5lVwj
 VfOCyS4bwqQ95sRqGTHDtTvOzNG9JaXl9XmRjCrhcTUA/eGxc1JHsykkT8WJ6C0/eB5E
 kVkCMcP7hVjIRL6SFxYv9nXzmHILkaKU3c5B80k8orPIVg99j1bpkr/QDshfAGgVFebF
 Emt+AA8fkYerkjKQNAiIWVjA5+uN/SfgJrlb8o3yGRRlOKDDK5ug+GExoKVbI7j5M3po
 5kR6yGW2N1q+QdrCjb2JEExezgDb0SPfNpQc/veA94Peij5Z5+5IZElWJ3dL8SrGZMqO
 +iYw==
X-Gm-Message-State: AOAM531NPM/64unTfU5mWreYROvDu1mnbXJVbUZB5HtrN332n1VgmkqM
 l0Y+ZVUqAZDHjaedow+qLCnKDA==
X-Google-Smtp-Source: ABdhPJxT9cxp1U8EXv22g8t43yc2F9riiqF+zpYFisUPqziMGnHw1PIj+Zfqh0lCo7aiBznqqCCdbw==
X-Received: by 2002:adf:e80b:: with SMTP id o11mr30535225wrm.409.1606130415390; 
 Mon, 23 Nov 2020 03:20:15 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:20:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Mon, 23 Nov 2020 11:19:17 +0000
Message-Id: <20201123111919.233376-39-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 38/40] drm/msm/msm_drv: Make '_msm_ioremap()'
 static
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
cy9ncHUvZHJtL21zbS9tc21fZHJ2LmM6MTI0OjE1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yIOKAmF9tc21faW9yZW1hcOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzog
Um9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3Js
eS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2
LmMKaW5kZXggNGQ1ODY2OGI4MDg1My4uZWRjOTllM2IwZWNhNyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2
LmMKQEAgLTEyMSw4ICsxMjEsOCBAQCBzdHJ1Y3QgY2xrICptc21fY2xrX2dldChzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2LCBjb25zdCBjaGFyICpuYW1lKQogCXJldHVybiBjbGs7CiB9CiAK
LXZvaWQgX19pb21lbSAqX21zbV9pb3JlbWFwKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYs
IGNvbnN0IGNoYXIgKm5hbWUsCi0JCQkgICBjb25zdCBjaGFyICpkYmduYW1lLCBib29sIHF1aWV0
KQorc3RhdGljIHZvaWQgX19pb21lbSAqX21zbV9pb3JlbWFwKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYsIGNvbnN0IGNoYXIgKm5hbWUsCisJCQkJICBjb25zdCBjaGFyICpkYmduYW1lLCBi
b29sIHF1aWV0KQogewogCXN0cnVjdCByZXNvdXJjZSAqcmVzOwogCXVuc2lnbmVkIGxvbmcgc2l6
ZTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRy
ZW5vCg==
