Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0FE2B4DB2
	for <lists+freedreno@lfdr.de>; Mon, 16 Nov 2020 18:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B02E6E9FA;
	Mon, 16 Nov 2020 17:41:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0A76E9F6
 for <freedreno@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l1so19645579wrb.9
 for <freedreno@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zaOWUirapOMKdJjjw4CYfsGkQWJEzsRRXuyaScDdWWw=;
 b=SZzvnaPlGmKaGhwLDI8bK/PrqeAqX3Tzh3PFCfAojHswVs3cNeVXia8ZyyNr/0HKml
 0Z7cEu+HZ/LfqDgJH3XVE36FVTy+hRhvEH6UZwZ2iS/UnxNr3bpr+YcDcNoJLSFym2sd
 enlFXh22dS+MhLz8hfl7RwQjUVJ35/+HjAKVQfY3sZi/xGOXVfq08KxiPIJiTHQFtk0O
 QivALG0h+IlOt2wmevscLXqGad1jp/hRwb321/w6WSfb0PErg240VG6L7pYaiGwhMDgR
 3hEM11SF8rorHuesj2T5fPLYilixaTFMkw/mSdNSJzVMFQLZqGEYLLtPFfziBjOOp8/h
 t6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zaOWUirapOMKdJjjw4CYfsGkQWJEzsRRXuyaScDdWWw=;
 b=Fk9lKhYRrMwd9fDF0IQy6Te5pDrZ/cBv1M456Nn1Pe/P/A8qCCc26IUK0O/6DD2ViS
 jJGAsKYtwHvcYHstiHqqCCAe3Q/u1pMDMRkYcNe44S5ETF4KRpRnxBUKBCQhEHkFJluZ
 v+sN5nQ0qMj6ZL5ea60L6QQoFvoYt+vpH6Zqm3RGsLXbWD6Kq04F0VHApRXOZdjnDPs3
 UOVEf56p3FHtGDlsYrTB16IR+ufcmgKRyh4Cb8nWrN3M4uDfIa1X7ITOX0+zC41FL39a
 z8ImqpMhf6xr520ze/MO/0XvlLZTPutjVJ1Hp2JiEtbQ3D+KUdZtyz4+QKFfUmoCwP/g
 3oCg==
X-Gm-Message-State: AOAM533kcnXOgHWeKpQ+Qz3UC+WDwJhUxAN6Y9eJgGMJfmlphaVEjSVk
 IqwEUIeYf4/xy7/5D5Or9UckfA==
X-Google-Smtp-Source: ABdhPJwDRGMUsoxv5ZHmxzgDdOLRIafHWuBlZ52nBUgXdgXycAMRa/hoxqy8d2KU665TpEmzQkY4KQ==
X-Received: by 2002:a5d:654a:: with SMTP id z10mr19192489wrv.285.1605548507104; 
 Mon, 16 Nov 2020 09:41:47 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:46 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Mon, 16 Nov 2020 17:40:48 +0000
Message-Id: <20201116174112.1833368-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 18/42] drm/msm/disp/mdp5/mdp5_kms: Make local
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
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
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
QGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBBYmhpbmF2IEt1bWFyIDxhYmhpbmF2a0Bjb2RlYXVy
b3JhLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCmluZGV4IGIzZWVjZjg2OTQ3
NzEuLjE1YWVkNDUwMjJiYzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9t
ZHA1L21kcDVfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9r
bXMuYwpAQCAtMjk2LDcgKzI5Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWRwX2ttc19mdW5j
cyBrbXNfZnVuY3MgPSB7CiAJLnNldF9pcnFtYXNrICAgICAgICAgPSBtZHA1X3NldF9pcnFtYXNr
LAogfTsKIAotaW50IG1kcDVfZGlzYWJsZShzdHJ1Y3QgbWRwNV9rbXMgKm1kcDVfa21zKQorc3Rh
dGljIGludCBtZHA1X2Rpc2FibGUoc3RydWN0IG1kcDVfa21zICptZHA1X2ttcykKIHsKIAlEQkco
IiIpOwogCkBAIC0zMTYsNyArMzE2LDcgQEAgaW50IG1kcDVfZGlzYWJsZShzdHJ1Y3QgbWRwNV9r
bXMgKm1kcDVfa21zKQogCXJldHVybiAwOwogfQogCi1pbnQgbWRwNV9lbmFibGUoc3RydWN0IG1k
cDVfa21zICptZHA1X2ttcykKK3N0YXRpYyBpbnQgbWRwNV9lbmFibGUoc3RydWN0IG1kcDVfa21z
ICptZHA1X2ttcykKIHsKIAlEQkcoIiIpOwogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJl
ZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
