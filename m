Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0BB349E7D
	for <lists+freedreno@lfdr.de>; Fri, 26 Mar 2021 02:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9A96EE97;
	Fri, 26 Mar 2021 01:17:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFBA6EE9A
 for <freedreno@lists.freedesktop.org>; Fri, 26 Mar 2021 01:17:48 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id gb6so1811372pjb.0
 for <freedreno@lists.freedesktop.org>; Thu, 25 Mar 2021 18:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=MXU0W4hXQSn5cT7nm9jJj1Hb0+VGd0Zn55IsoZ/3xBk=;
 b=ExHK77K4VDDdqJH5CuFON7d7VeJ6QZbD6RH8skpBGIrkJjX9bY2zXQ6ZIFA9k2iXcT
 IdF3zJ0D9RFCU2+qYJBYJpSNK2wIZ0cLm/0XUr43gRoroudO+4DLsCuNR0OvM/AdLBiK
 68KfdHjYt/Qwr3Iw0gWJGQhVghgZKnTC7s7oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=MXU0W4hXQSn5cT7nm9jJj1Hb0+VGd0Zn55IsoZ/3xBk=;
 b=CdGwfQucbpwbEyTzdeZsWe05qx7LKcMHXN37dypu1tmzriTG+4YhbBWHqSCFJcejSG
 9RGCy1aWxuAW6T9jwPMjQS6orkVNj+hHXxjPbHpIRSgHmObhhNSxYvmnbDQo6QHYij8m
 aMx6K0tg7Lggy/4PO92eVv5J8WD/e2i88vM05kAmbJB5v1Gyu9XgOHDPCEyPeqQXdVQP
 xOfrGvKSJSqwzjGh3YMK4z9JDcxm7n0mMhHRYrrWT5Dny60v+1PUMW/RcErmlj1KaaZp
 Li9Dv57fH3iAXZx4rSemXptAbCInRsfRy8OzIUSk/v2sIYih8l8eXcOEYrLtjYuXD8AZ
 O3PA==
X-Gm-Message-State: AOAM531tdDGnkY3nIlGVTHqHrXU6/SN74s0pDDfumCQ5aEDSMWNxlTpJ
 17J+ECenRi7MqE9kafWG3VG7Vw==
X-Google-Smtp-Source: ABdhPJxVdMESi38YKv6tWdoN04fZg2j9Ch/YSvv1lfeNHE28AamjYJomTaTYGm57PsOUU1cZ1UNVLg==
X-Received: by 2002:a17:90a:bb91:: with SMTP id
 v17mr11019736pjr.24.1616721468438; 
 Thu, 25 Mar 2021 18:17:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
 by smtp.gmail.com with ESMTPSA id x7sm7453681pfp.23.2021.03.25.18.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:17:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1614971839-2686-2-git-send-email-abhinavk@codeaurora.org>
References: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
 <1614971839-2686-2-git-send-email-abhinavk@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
Date: Thu, 25 Mar 2021 18:17:46 -0700
Message-ID: <161672146644.3012082.15695024069473643069@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dp: Fix incorrect NULL check
 kbot warnings in DP driver
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 khsieh@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, dan.carpenter@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2021-03-05 11:17:18)
> Fix an incorrect NULL check reported by kbot in the MSM DP driver
> 
> smatch warnings:
> drivers/gpu/drm/msm/dp/dp_hpd.c:37 dp_hpd_connect()
> error: we previously assumed 'hpd_priv->dp_cb' could be null
> (see line 37)
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
