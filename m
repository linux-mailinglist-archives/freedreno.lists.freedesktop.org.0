Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A01CC1E907
	for <lists+freedreno@lfdr.de>; Thu, 30 Oct 2025 07:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D869910E24C;
	Thu, 30 Oct 2025 06:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cXRJAvWT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528A610E24C
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 06:31:52 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-78125ed4052so1106194b3a.0
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 23:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761805912; x=1762410712; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IteJbnpQxtDfi0VoQZa3f0/zEOSuD+t4NwFKFFHXmzw=;
 b=cXRJAvWTJIQ9kxsFSHM41atDpr48MBRne1r4MuhwI7QTgfhXAdAxZ+EuvQmGyxEn6l
 SeDe99fWC+rPpBzuchl8DnFVKYwq4fzykKAK3UfuhZ8B3h+48sHFvxmtTNen+h2ie1MJ
 MLALfIdKh+wj8dZn19ZiQKh+BG/ddZiRWIsOhNWEFBWp7iOm5WJta4zsXZxWAiq/+0ph
 iCVcvpURdFi/KDy1VfAVy0RV1HvD268O7sVdDKErCMz8vCwYUgO7xvyQvO1JBLUufNVZ
 bKCcVp7iNsQIj+XTwaqWk/9OhKSD+yiSrH7lfHvulFFzgDFfJvpCkldYiopzkNXnSHZP
 EoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761805912; x=1762410712;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IteJbnpQxtDfi0VoQZa3f0/zEOSuD+t4NwFKFFHXmzw=;
 b=g9mY6SbX2tM9x3MTJKzdkSGC5eiJ1khJP7jsp7kY/M4dvYEsj+zyUPvMIuferStMRD
 gfX4MfvqVLIlv2ukepX+mvLTTYcMm8eEm28e5rOtsLeuWuLRHxcbQSTCf3C4E5Zq5Hf3
 tIVwJhX16a/j2b8eumAmyGvmL9Ar46oby6rZtKvZsFGRHctqXiYKtpeXkD2/VOYVHrxg
 EAacsFasXRxs5XMBvRsHNlPHVDEsmHnCEzlBLx597Cu4JduWXK9enk+hWQ+QN7D/Kyzh
 SppxW9kHm2j9Y3owXENyvKf+iCK2yKzSAC4bZRWdzOOZKcn7EM4gw+pGf+mCAbgDqlSr
 pisw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKyh9SAFge2RYgCFh0KvbzCmB/ksw767o0RBby7gmZYVBLRc5nwBi9VlqUxor/2yVuAMY86fGrRBc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuMZGsciBcF7LuFf7E7861XJveJHy0sxJfWGNR7CO8MuO8+AGN
 Or0qX0kE7hgk96pKU5zz6DGCm3WWUL8bh2c7xyBtWSObSI+9GUIq+h/R
X-Gm-Gg: ASbGncv2/uUNogoVhJtjC4BC9fbrLW+Y+rEV9A9kqyZz7PJxM15bYYzKLpPNBOJWD20
 bhY3fpLHOAsxfiC44u1LnD8I7mDP1KbRKYj8i7AyZRE7S6/V+Lrl2x/pFokwsuKIE/aEtAi1KES
 /jTU95LTjwWjx4mAb2HeozBPTs9TYomdojZ+4g+OLBmHXGcyyONR9YpGEC2w3n1sugC/IeC5Uf8
 t4XmgdUD8LTz4FNFRgsZMbslweI0Bb56d98NQ/uqGtzCdduHi8VAAfYWxG3x/1tp8PwlQ4bC+sz
 RCOVfKh863KifQEG2EvqWDzKgdTp7gn3tfdxJM29TtQJwqMD8vQGEGnA+ctnUO4kM+If9acUNB+
 zCWKqvxBg6AvRd7OHsrhvzAVYtC9N82FB6h8wcoUGXoxNvMSc8hWQlkuEr2PrdMpwvYYv9sQnrE
 bxCavHyrdSzhL34PFmUSO0eettff2xeN4NnGNb3jscnQtaXvZiCXsuTqU=
X-Google-Smtp-Source: AGHT+IHNvKCn04TUtBKiitaic4J2q30Yzc+qOqNpAkIf4/fyYDmwz0RWuqOmy8D+jYX31HnPUWKBbQ==
X-Received: by 2002:a05:6a00:2e23:b0:780:f6db:b1bd with SMTP id
 d2e1a72fcca58-7a62a361761mr2569135b3a.4.1761805911695; 
 Wed, 29 Oct 2025 23:31:51 -0700 (PDT)
Received: from stravinsky.localdomain (ip72-203-100-4.oc.oc.cox.net.
 [72.203.100.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414049a44sm17200296b3a.35.2025.10.29.23.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 23:31:51 -0700 (PDT)
From: Jessica Zhang <jesszhan0024@gmail.com>
Date: Wed, 29 Oct 2025 23:31:45 -0700
Subject: [PATCH] mailmap: Update Jessica Zhang's email address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-mailmap-fix-v1-1-8534ffa12ed3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFAGA2kC/x2MQQqAIBAAvyJ7TlDTkL4SHcS2WkgThQjEvycdZ
 2CmQsFMWGBmFTI+VOiOHeTAwJ8uHshp6wxKKCOFsjw4uoJLfKeXG6FH7Y22Vk7Qi5Sx6/+2rK1
 9ezZC/V0AAAA=
X-Change-ID: 20251028-mailmap-fix-50434c548816
To: neil.armstrong@linaro.org, lumag@kernel.org, robin.clark@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15-dev-509f5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761805910; l=1226;
 i=jesszhan0024@gmail.com; s=20251028; h=from:subject:message-id;
 bh=EvEXTz0KOxz6r+4dee3gAhObDEZ9RzGv4u6rNYbYStE=;
 b=4AiNnU52GcTLFxFVrVFNRtBIYgDMcsTe1X5gNVFGem6rW0dpFbRAMuLF/g8ZuCZZ4pAV7ZETd
 /Cm12ZhzY7PD6ExKeMtG+CG5/e/RDBmWXFODJU9FyALDeZ1gLr62emS
X-Developer-Key: i=jesszhan0024@gmail.com; a=ed25519;
 pk=Qjsztzh+H8Xz0uqVst7N2PHX5Vnd3JXONpkaTHqk/Pk=
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Update mailmap to point to my current address

Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jessica Zhang <jesszhan0024@gmail.com>
---
 .mailmap | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index b77cd34cf852..1c57bd649f04 100644
--- a/.mailmap
+++ b/.mailmap
@@ -352,7 +352,9 @@ Jesper Dangaard Brouer <hawk@kernel.org> <hawk@comx.dk>
 Jesper Dangaard Brouer <hawk@kernel.org> <jbrouer@redhat.com>
 Jesper Dangaard Brouer <hawk@kernel.org> <jdb@comx.dk>
 Jesper Dangaard Brouer <hawk@kernel.org> <netoptimizer@brouer.com>
-Jessica Zhang <quic_jesszhan@quicinc.com> <jesszhan@codeaurora.org>
+Jessica Zhang <jesszhan0024@gmail.com> <jesszhan@codeaurora.org>
+Jessica Zhang <jesszhan0024@gmail.com> <quic_jesszhan@quicinc.com>
+Jessica Zhang <jesszhan0024@gmail.com> <jessica.zhang@oss.qualcomm.com>
 Jilai Wang <quic_jilaiw@quicinc.com> <jilaiw@codeaurora.org>
 Jiri Kosina <jikos@kernel.org> <jikos@jikos.cz>
 Jiri Kosina <jikos@kernel.org> <jkosina@suse.cz>

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20251028-mailmap-fix-50434c548816

Best regards,
--  
Jessica Zhang <jesszhan0024@gmail.com>

