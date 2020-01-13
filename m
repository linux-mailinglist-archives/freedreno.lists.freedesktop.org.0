Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 936B91394EA
	for <lists+freedreno@lfdr.de>; Mon, 13 Jan 2020 16:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D73989F6F;
	Mon, 13 Jan 2020 15:36:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-xc62.google.com (mail-yw1-xc62.google.com
 [IPv6:2607:f8b0:4864:20::c62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DACD89F6F
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jan 2020 15:36:49 +0000 (UTC)
Received: by mail-yw1-xc62.google.com with SMTP id l14so6321566ywj.9
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jan 2020 07:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XJFdDikfbN+KalEJTdnTdl6gsZ3fW2Tc7ZjkvYTvyD0=;
 b=Ra1HwBngnQsFsdibS3erX1ro72SPNFOPBuna6fAXIQWG17KVuwQqD9gMrdmCX7ki+B
 EfZnaFMA5gKVT3d2qJucInxK1XRuJFIQjhpLG292NZcU6B2kEOsnvEAtLvx58jiTXMJk
 R3JhbyxnKu264DFtvTI48xgHQS4fvpOzUpteR3OrVr78AnbU2zIkVDSvrN5ZD8cvjeee
 JFM3IRmFzWideOV8V9KEow0sfm4l9HLJVDVYnrOiZTg2y3gnmUrcDev8aU5KY5uD5KlR
 ZI8urhn7LhvdDYHsVAv38s1cdzYy0VpHd73CuBsHJdDdJIh3/5QdZn3CfaseC0z8UOlv
 K8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XJFdDikfbN+KalEJTdnTdl6gsZ3fW2Tc7ZjkvYTvyD0=;
 b=VJ5CuwnSk570qSyB9HOlO3SyjHIKKYsSbybabz5yXxJy7ELpZfyzuCXmI8JO8jZ0K8
 iyXJAFMLOoIpsu4GtsKS6dp8dmVqN2ynDrPwtd6C5GWvVXT5BdQRIvhA+tBJfiHXI9Nb
 kROo2BUk47c+sgA2uv+c34drShO0CMfQociEBW/sD0xXEahlnj+Mte9KgM/5USnwzB5Q
 uUuox1c6zMmBi0+QJWBeTXKjXauRLwUk0CabHPDVZFVBGAAwt0X5sp49XLojHQ4ig4eK
 DJr0q9V2NyZC7xFF++qCmCduWgSycs3d4wZKV4uPsfdMOY9WxhX1AY5ktljiO81Infle
 G7aw==
X-Gm-Message-State: APjAAAWsISwjhxENyZCtuUUS+NImYFujzkmO3H75QfZJyVPLMnNH1vxi
 3XL7pRYVXMnzxKbrhNNlBX+vD34qxBdFB38ikZmLHS8EyizrkA==
X-Google-Smtp-Source: APXvYqze74w6U50gaTJnAzutIy9P9BFgvcZsIGa2e6zF7CwAW4jN8VuBPit1CodjbUXUBdLxFIXm1nt6Mg+C
X-Received: by 2002:a25:2c9:: with SMTP id 192mr12441529ybc.48.1578929808492; 
 Mon, 13 Jan 2020 07:36:48 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id m193sm1672393ywd.0.2020.01.13.07.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 07:36:48 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Date: Mon, 13 Jan 2020 10:36:03 -0500
Message-Id: <20200113153605.52350-1-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, Brian Ho <brian@brkho.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 hoegsberg@chromium.org
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

 drivers/gpu/drm/msm/msm_drv.c | 63 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c |  4 +++
 drivers/gpu/drm/msm/msm_gpu.h |  3 ++
 include/uapi/drm/msm_drm.h    | 13 ++++++++
 4 files changed, 81 insertions(+), 2 deletions(-)

-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
