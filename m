Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A282C30D6
	for <lists+freedreno@lfdr.de>; Tue, 24 Nov 2020 20:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0629D6E530;
	Tue, 24 Nov 2020 19:44:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761F16E532
 for <freedreno@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:04 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a3so80738wmb.5
 for <freedreno@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DTo1OeJsTMi708YCunPWIPmexxKTRjfpe4q5AMYK+8k=;
 b=AdFPXVRq91HXvmzYsLOfIxNCl+1jVT27YrmgFCSoMfUOF/IJY75qGZkjBGPa68nVx+
 vgrGSGE/17aRzboCcz0qYX1UESnuJdo8J2zZxxj5YzEg2AYppSRdvIP0fhPMr/r10zCu
 1Tz8kM7LyZBytsrhbHvEyaNIGq3lqD6oZSwczk8BbL7+ZNsYIaXIp64ePN68spYVwfvO
 DgsaAr9GZBY1m/OIXOdcGGr3/BkRKzoDXXZf9ScAXxYHNvcIZsYXGenADIi8ryBFEDsf
 g1A2ywPf2/GAn7RmfvYoeL/Kxf9Mdc8OMSRt0RL18XxkC5BB5pZ/poO3Wf1jqsWcp6dM
 kOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DTo1OeJsTMi708YCunPWIPmexxKTRjfpe4q5AMYK+8k=;
 b=YGQ4MPUu+RPP2Sb8hAAJUNGRnNVN5zcA+R8nNIu5LilQ0QEoocCqcznqOezovIH4br
 VWoz2jhHZ7CkaKCP0kViDMLhenJAzl9RKnj4WyCSMV9+uHCptvW5+WzS/R2oP9jqVxA4
 eDyVLcMZ0lLcTp6bvaFnJZgqO4Id8SFgmXBh6oTWvCofLY8PzkdpuwPlDWTn/OkWzWhq
 62HFNTM4RH9FngTPpMZKF19OWdY5xVBlxrL/y0M2uB4MIQwnB8SYSuNi7z1iZ0xwdo/R
 7Hb6xYWWOBY9agy/NNrKhIJ6XzGK+tiLyJHmHbCLwEtH5sjsOGqCDd+n3d/J05u+Qhlz
 TeCA==
X-Gm-Message-State: AOAM5336og0WCyz8hyoiCQhYhxG6rnoSDwbuewDUuM9IX5aYb6E9CWLV
 txO+ptkRK66gh2N6JCT+qKO+ag==
X-Google-Smtp-Source: ABdhPJxkibkRVGkcK95WR2K9W8ZA7y6vi0pEa1l+e3tU26brziMvgP66uY0Vo6rHrq+75BUtzOvGWg==
X-Received: by 2002:a1c:9901:: with SMTP id b1mr22910wme.18.1606247043062;
 Tue, 24 Nov 2020 11:44:03 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:02 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 24 Nov 2020 19:37:47 +0000
Message-Id: <20201124193824.1118741-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 03/40] drm/msm/adreno/a6xx_gpu_state: Make some
 local functions static
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
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHVfc3RhdGUuYzo4Mzo3OiB3YXJuaW5nOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHN0YXRlX2tjYWxsb2PigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHVfc3RhdGUuYzo5NTo3
OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHN0YXRlX2ttZW1kdXDigJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9n
cHVfc3RhdGUuYzo5NDc6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhh
Nnh4X2dwdV9zdGF0ZV9kZXN0cm954oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCkNjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRl
c2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHVfc3RhdGUuYyB8IDYgKysr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1X3N0YXRlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdV9zdGF0ZS5jCmluZGV4IGU5ZWRlMTkx
OTNiMGUuLmMxNjk5YjRmOWE4OTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRy
ZW5vL2E2eHhfZ3B1X3N0YXRlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4
eF9ncHVfc3RhdGUuYwpAQCAtODAsNyArODAsNyBAQCBzdHJ1Y3QgYTZ4eF9zdGF0ZV9tZW1vYmog
ewogCXVuc2lnbmVkIGxvbmcgbG9uZyBkYXRhW107CiB9OwogCi12b2lkICpzdGF0ZV9rY2FsbG9j
KHN0cnVjdCBhNnh4X2dwdV9zdGF0ZSAqYTZ4eF9zdGF0ZSwgaW50IG5yLCBzaXplX3Qgb2Jqc2l6
ZSkKK3N0YXRpYyB2b2lkICpzdGF0ZV9rY2FsbG9jKHN0cnVjdCBhNnh4X2dwdV9zdGF0ZSAqYTZ4
eF9zdGF0ZSwgaW50IG5yLCBzaXplX3Qgb2Jqc2l6ZSkKIHsKIAlzdHJ1Y3QgYTZ4eF9zdGF0ZV9t
ZW1vYmogKm9iaiA9CiAJCWt6YWxsb2MoKG5yICogb2Jqc2l6ZSkgKyBzaXplb2YoKm9iaiksIEdG
UF9LRVJORUwpOwpAQCAtOTIsNyArOTIsNyBAQCB2b2lkICpzdGF0ZV9rY2FsbG9jKHN0cnVjdCBh
Nnh4X2dwdV9zdGF0ZSAqYTZ4eF9zdGF0ZSwgaW50IG5yLCBzaXplX3Qgb2Jqc2l6ZSkKIAlyZXR1
cm4gJm9iai0+ZGF0YTsKIH0KIAotdm9pZCAqc3RhdGVfa21lbWR1cChzdHJ1Y3QgYTZ4eF9ncHVf
c3RhdGUgKmE2eHhfc3RhdGUsIHZvaWQgKnNyYywKK3N0YXRpYyB2b2lkICpzdGF0ZV9rbWVtZHVw
KHN0cnVjdCBhNnh4X2dwdV9zdGF0ZSAqYTZ4eF9zdGF0ZSwgdm9pZCAqc3JjLAogCQlzaXplX3Qg
c2l6ZSkKIHsKIAl2b2lkICpkc3QgPSBzdGF0ZV9rY2FsbG9jKGE2eHhfc3RhdGUsIDEsIHNpemUp
OwpAQCAtOTQ0LDcgKzk0NCw3IEBAIHN0cnVjdCBtc21fZ3B1X3N0YXRlICphNnh4X2dwdV9zdGF0
ZV9nZXQoc3RydWN0IG1zbV9ncHUgKmdwdSkKIAlyZXR1cm4gICZhNnh4X3N0YXRlLT5iYXNlOwog
fQogCi12b2lkIGE2eHhfZ3B1X3N0YXRlX2Rlc3Ryb3koc3RydWN0IGtyZWYgKmtyZWYpCitzdGF0
aWMgdm9pZCBhNnh4X2dwdV9zdGF0ZV9kZXN0cm95KHN0cnVjdCBrcmVmICprcmVmKQogewogCXN0
cnVjdCBhNnh4X3N0YXRlX21lbW9iaiAqb2JqLCAqdG1wOwogCXN0cnVjdCBtc21fZ3B1X3N0YXRl
ICpzdGF0ZSA9IGNvbnRhaW5lcl9vZihrcmVmLAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZy
ZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
