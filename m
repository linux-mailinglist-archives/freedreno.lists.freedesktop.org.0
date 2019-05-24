Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2902A29D01
	for <lists+freedreno@lfdr.de>; Fri, 24 May 2019 19:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B811B6E131;
	Fri, 24 May 2019 17:32:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A156E130
 for <freedreno@lists.freedesktop.org>; Fri, 24 May 2019 17:32:39 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id w127so2042341yba.0
 for <freedreno@lists.freedesktop.org>; Fri, 24 May 2019 10:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nxi1zwuqndJEn18AdpEkkdQlNqPXeDyt3jpcO1TOWSU=;
 b=unYvfxLfVLgxpmARXynArstYKthVlZSIs5xhXDtjNIqTLytfVAF9XWXLx8ws+TGPXr
 J3LCu4dxUTfG24egfR8T5HSp9q3ZYTcyvCac/FmAEovZRBi6nOGxVdz36fx96Gs48e1X
 XD89KICk5wCeJY0+GDz9c8pt+ag0ATqKF1u3EVSxyIAiC7LyvkIEGTmcc3oJ8i6pbS8U
 AptRiKO/+hgnx2VRssdndL/If6Bo7WWux6nWCuuNabBPJTjNDEGezgLkXFsSUiVWPT2k
 JU0NAdfOQ68xW68RXzRRpJIKsv/Wc3n5g5aX7HZ9CN4NYfzU4sjLivY7S9pzzbq5lQ/F
 5Ntw==
X-Gm-Message-State: APjAAAVMkeuhUZtZFiXrh5w33ObG6SEvCrG7KO4Tga8DW5gAIw4ulZP2
 gY7/LYivpOu57ifm5HX4jJgitQ==
X-Google-Smtp-Source: APXvYqxA8fEtKhzhjbVv+cpIIdWmhzSrXOz4QZdMwEHQFhbwHwzQbYDAGyZce/2VKLRwxnxf+fNpNQ==
X-Received: by 2002:a25:2a86:: with SMTP id
 q128mr28108060ybq.108.1558719158775; 
 Fri, 24 May 2019 10:32:38 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s17sm774437ywg.70.2019.05.24.10.32.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 10:32:38 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Date: Fri, 24 May 2019 13:32:19 -0400
Message-Id: <20190524173231.5040-2-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190524173231.5040-1-sean@poorly.run>
References: <20190524173231.5040-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nxi1zwuqndJEn18AdpEkkdQlNqPXeDyt3jpcO1TOWSU=;
 b=Nw0MCBee/TWTmAxdRVs1IXvAqt1Jv/rkylswgDtTDj9WT/2AwQV8ROQPZCwQUSsPQH
 CU65nugMd4ePhX+UmTx3odq2/HhWQIRrsb4QxiotNxJUz3SdaaGhSTK6WN9ycUPqXkjS
 v+az9kyt50Ha2zamem4lMcJ10IBLtQz3JaTZtTBBDWVXUoaprnws4vWngGzhnu7aROzi
 ew9xCt8+1yQQbkKeBiGlyxlzoq7nQeUYIzOokXTz2PrRcNUR5pB2TkAS1ceWLj8mrECe
 tKOyj/kiYyAgoxQTIPDZNclFfGYzjxziEJtphtj9JZmg1FQroqEIZkGEUCWvj1fHGZsD
 FRng==
Subject: [Freedreno] [PATCH 2/2] drm/msm/dpu: Remove _dpu_debugfs_init
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
Cc: Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpGb2xkIGl0IGludG8gZHB1
X2RlYnVnZnNfaW5pdC4KCkNjOiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+ClNp
Z25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyB8IDEwICsrLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCmluZGV4IGQ3NzA3MTk2NTQzMS4uMGE4YzMzNGMzYTlm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCkBAIC0yMzEsOCArMjMx
LDkgQEAgdm9pZCAqZHB1X2RlYnVnZnNfY3JlYXRlX3JlZ3NldDMyKGNvbnN0IGNoYXIgKm5hbWUs
IHVtb2RlX3QgbW9kZSwKIAkJCXJlZ3NldCwgJmRwdV9mb3BzX3JlZ3NldDMyKTsKIH0KIAotc3Rh
dGljIGludCBfZHB1X2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHB1X2ttcyAqZHB1X2ttcywgc3RydWN0
IGRybV9taW5vciAqbWlub3IpCitzdGF0aWMgaW50IGRwdV9rbXNfZGVidWdmc19pbml0KHN0cnVj
dCBtc21fa21zICprbXMsIHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKQogeworCXN0cnVjdCBkcHVf
a21zICpkcHVfa21zID0gdG9fZHB1X2ttcyhrbXMpOwogCXZvaWQgKnAgPSBkcHVfaHdfdXRpbF9n
ZXRfbG9nX21hc2tfcHRyKCk7CiAJc3RydWN0IGRlbnRyeSAqZW50cnk7CiAKQEAgLTU3OCwxMyAr
NTc5LDYgQEAgc3RhdGljIGludCBfZHB1X2ttc19kcm1fb2JqX2luaXQoc3RydWN0IGRwdV9rbXMg
KmRwdV9rbXMpCiAJcmV0dXJuIHJldDsKIH0KIAotI2lmZGVmIENPTkZJR19ERUJVR19GUwotc3Rh
dGljIGludCBkcHVfa21zX2RlYnVnZnNfaW5pdChzdHJ1Y3QgbXNtX2ttcyAqa21zLCBzdHJ1Y3Qg
ZHJtX21pbm9yICptaW5vcikKLXsKLQlyZXR1cm4gX2RwdV9kZWJ1Z2ZzX2luaXQodG9fZHB1X2tt
cyhrbXMpLCBtaW5vcik7Ci19Ci0jZW5kaWYKLQogc3RhdGljIGxvbmcgZHB1X2ttc19yb3VuZF9w
aXhjbGsoc3RydWN0IG1zbV9rbXMgKmttcywgdW5zaWduZWQgbG9uZyByYXRlLAogCQlzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIpCiB7Ci0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVy
LCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZnJlZWRyZW5v
