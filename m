Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8681137A49
	for <lists+freedreno@lfdr.de>; Sat, 11 Jan 2020 00:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6A76E146;
	Fri, 10 Jan 2020 23:39:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf62.google.com (mail-qv1-xf62.google.com
 [IPv6:2607:f8b0:4864:20::f62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FDA6E0F7
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jan 2020 23:34:12 +0000 (UTC)
Received: by mail-qv1-xf62.google.com with SMTP id m14so1606750qvl.3
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jan 2020 15:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MvS/BTzSIoKxmLzPOIXWsFB+5KToGI4XyDbPQb3f/hA=;
 b=FfsAT9Rm/De3E72TdNl/rKpI9zkP0m3DU1JzBLMQxscjat6kPwSDTREM98W/HUuFdQ
 rO5PqXmfQ1nQXHD+xnewxF3Y14sU3p6fiTRBa3Xsf3sqgflswO89KzES9hZp+KGe9Yjq
 ItmLxuz0zsNfnMCmkUXuyAvzq6VzWUedZZlmTF36cPlnXHXF2BwjrqXu5O0xwDY2R0Ei
 Xtxb4l6VACImUh+IA6JQuwi+CwK8I90KoJlJkMmB4hoZhHQLSl7Ad2WOyBqgeLzzPeFZ
 gVmnQAjQ80+eQM/cyxM4gJIMCdb3uIpa073/6EKIblf4iG0hz05L+asQU0JZxMiq76QN
 Pzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MvS/BTzSIoKxmLzPOIXWsFB+5KToGI4XyDbPQb3f/hA=;
 b=EVaC5QF2/keVTV4kZBXdLLckbxeTYC8ceKVOFQFVBqqT1wpugcYmQ5y4Zkt7Twwjty
 1jRzd3AVyzUrWU2LxEJx5XELPx35LivLuvtqaKifrSFlXI15EIswxzECQGVDVTfvXYFR
 yrX3onvICtVnlybbWhPaUDqQ/xrrpTZXTW7fYm6XQqci7zDnIQAn/ssRNQmCJRfrkEZ1
 qNKZo4ct3cqZMBYis3QkyTD3HrBHLkYIcFnRr+Rh0B6Qnzwbr0V7DDDVSJNvoHIj9KRB
 XdSL+CNJD17sbFLV78aX5WwuMNR7tQr1FFbijl6B+nqEYI/OxkytTbvvpXxrbPEjZu0v
 WxVA==
X-Gm-Message-State: APjAAAVzIsfVdSxoypxBAwKnRDCMjEfHDKIZ94MlpWm17WvFNt+NEGZZ
 fZ3jNxuNgohnuKGYeX/92g7DAGJ7wITLt9n7K6E/h+04zTeAwA==
X-Google-Smtp-Source: APXvYqzg1I0qCn/YGix5mPeq/MB2S1mhcCZ3LIT+UWWrFmsrMqR3GP1rNejyq1BsuWLWGacEQAIr8gDVy5Jp
X-Received: by 2002:a05:6214:1103:: with SMTP id
 e3mr1127425qvs.159.1578699251849; 
 Fri, 10 Jan 2020 15:34:11 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id h26sm433007qkj.2.2020.01.10.15.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 15:34:11 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Date: Fri, 10 Jan 2020 18:33:48 -0500
Message-Id: <20200110233350.138471-1-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jan 2020 23:39:11 +0000
Subject: [Freedreno] [PATCH 0/2] drm/msm: Add the MSM_WAIT_IOVA ioctl
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
Cc: robdclark@chromium.org, hoegsberg@chromium.org, Brian Ho <brian@brkho.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patch set implements the MSM_WAIT_IOVA ioctl which lets
userspace sleep until the value at a given iova reaches a certain
condition. This is needed in turnip to implement the
VK_QUERY_RESULT_WAIT_BIT flag for vkGetQueryPoolResults.

First, we add a GPU-wide wait queue that is signaled on all IRQs.
We can then wait on this wait queue inside MSM_WAIT_IOVA until the
condition is met.

The corresponding merge request in mesa can be found at:
https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3279

Brian Ho (2):
  drm/msm: Add a GPU-wide wait queue
  drm/msm: Add MSM_WAIT_IOVA ioctl

 drivers/gpu/drm/msm/msm_drv.c | 60 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c |  4 +++
 drivers/gpu/drm/msm/msm_gpu.h |  3 ++
 include/uapi/drm/msm_drm.h    | 12 +++++++
 4 files changed, 77 insertions(+), 2 deletions(-)

-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
