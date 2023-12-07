Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52FA809424
	for <lists+freedreno@lfdr.de>; Thu,  7 Dec 2023 22:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C45C10E995;
	Thu,  7 Dec 2023 21:30:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EAF10E990
 for <freedreno@lists.freedesktop.org>; Thu,  7 Dec 2023 21:30:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c32df9174so332755e9.3
 for <freedreno@lists.freedesktop.org>; Thu, 07 Dec 2023 13:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701984652; x=1702589452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kv7WKqsewmUapKUyFSaVXbiz5Tdgf6hTLK9Dopl1Xvg=;
 b=KZLZPPCZk+QEJhVsmpygQsmREIru6nux/wzcIsA8RaHnJGqZ9VQUJRyXnSRSDFFq6h
 R5CxIDS4FJG/kr0AOxEXH2BZNsDXhOhOoNMuQ3CrtH/G9xjIZmebs7jTMaW+JALIg+Yj
 CeTmmFDc2MFDxmq1EzyqHg2DtUv1AeALmgMjMjwhwcZQi9UTgFpjj4HEVZ6uoD/aTguU
 GGW+A9uXhnlpW6Oxc68KPQm0Rvv/In5q7CYFNdWc+Cx1yCJhQDSnKx/IXjdMDNPwub8N
 IETGwgwQ8mAsUz1n3TTAnSDsmATCmsiqLAlkR3kbE+yZXcydaDppZ9YtQg5lVkoJ0CrD
 0fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701984652; x=1702589452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kv7WKqsewmUapKUyFSaVXbiz5Tdgf6hTLK9Dopl1Xvg=;
 b=buR532tVyodK0khnqP/hDaq5yHxXF88nCQvVa8twgIetc5TBrlbDbIXI4Um3hlL9xy
 N9T177ObPfqG8vWoumztFqxueJp7HJxrYfHC7THYkFCmUaqRtxfNIoQjPkldOeBvua/D
 A0kp+mjzm+2DFy3mMWYL1gOAzSrBS8bD7UUSgFIPzcR5M/yA7oy+wDQ8HHkQWbKC6F0G
 bsRZIPJ9B0D5f74oBlnrbTq4F4tEZL+lxOxNjEK8s4+TkV6VlgdyqvF07X/8fk3P5YrL
 egwlBAO9GlMKe2wuRQGd5COzWmQ2UTjnWtjLZ7yL3Ry8hgEz3poQH4N1mMwYIKVju6DG
 ktkg==
X-Gm-Message-State: AOJu0YxK6KTAaypxhiBQtT3T7eBsNDhTuIJY8cBm4M8OwR3uXFF6ySqN
 XiHkRAM/cUDXZhe9IBD0tbZD2FB0xog=
X-Google-Smtp-Source: AGHT+IF9otFCHY4SAn6+5yericrC5hWUiveUicDnPWB4n6kleqsFDs5YLXKg2qbv1cqKQYf3SKS7EQ==
X-Received: by 2002:a05:600c:3591:b0:40b:5e21:c5b2 with SMTP id
 p17-20020a05600c359100b0040b5e21c5b2mr1375877wmq.128.1701984651631; 
 Thu, 07 Dec 2023 13:30:51 -0800 (PST)
Received: from lucy.. (cpc115984-dals23-2-0-cust371.20-2.cable.virginm.net.
 [82.25.1.116]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c468900b0040b42df75fcsm788310wmo.39.2023.12.07.13.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 13:30:51 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] Add param for the highest bank bit
Date: Thu,  7 Dec 2023 21:30:46 +0000
Message-Id: <20231207213048.1377147-1-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Connor Abbott <cwabbott0@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The highest bank bit is a parameter that influences the Adreno tiling
scheme. It is programmed by the kernel, and is supposed to be based on
the DRAM configuration. In order for Mesa to tile/until images itself,
it needs to know this parameter, and because it's programmed by the
kernel, the kernel should be the source of truth.

Mesa series: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26578

Connor Abbott (2):
  drm/msm: Refactor UBWC config setting
  drm/msm: Add param for the highest bank bit

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  21 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 101 +++++++++++++-----------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |   3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |   9 +++
 include/uapi/drm/msm_drm.h              |   1 +
 5 files changed, 82 insertions(+), 53 deletions(-)

-- 
2.31.1

