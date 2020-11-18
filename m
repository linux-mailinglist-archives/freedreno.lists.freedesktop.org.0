Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C581B2B74DB
	for <lists+freedreno@lfdr.de>; Wed, 18 Nov 2020 04:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA616E0BE;
	Wed, 18 Nov 2020 03:36:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98C16E2B6
 for <freedreno@lists.freedesktop.org>; Wed, 18 Nov 2020 03:36:04 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id gv24so324156pjb.3
 for <freedreno@lists.freedesktop.org>; Tue, 17 Nov 2020 19:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=diUqtZunx/UjcqbbhT4Je7Zj6fu6UKGAwXhMW5mk2Gk=;
 b=AMLoDLL3GfVM1STbX9/xTk6VliNiJr0YwOLeAg7i54QP7EoCz7VMk955TElCpWmwiI
 j9N2sIXacWcnmimKGbxoHCEXSLpD7ZmjhUwdUKU1vs/FXxsrdOrgIPsrl/2t60juYxcB
 DDIALijMpGftZLW1UXskLBZsWao12HjQTBWXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=diUqtZunx/UjcqbbhT4Je7Zj6fu6UKGAwXhMW5mk2Gk=;
 b=pN9Q7IDyU6m8/Ixh0Yu89EsioKI5XX6ar2ydGHSRhuriNzeptqNPmOS9BkplQ1Z/8j
 vK2/8g4gW/FYSDwDPG3kgZsS+RTml6+vs4WL0Ht6T4KP9KueWmz4DAU2J+cvFeP6N8wD
 U6gqf7CGW4X53UhiSRNZ/ap5DErhhmR1Q0Hh/I2bK97T39XmB1K5fi5NWqVzv7LbEPyJ
 S4xXw2wqiIG9y2goP+d1Hrl6TnvtBsznPKj96EXMIJI/7UeTzJjl8h0Bwp7M5joa0hyV
 cphwOoKelvH+E5ZCwGTlLoDOz4bdD9PEV3z0t1TMzNsHlYnwcYfWwpzi0xcIi/a95La2
 tj1g==
X-Gm-Message-State: AOAM533Z1SvRg55KVf0Us8Eqf1/ivKKMW3seMOBhVZxwHcRdTOteGKFd
 GiMO8bF0gHmEISR54Zz5NntNBg==
X-Google-Smtp-Source: ABdhPJzVAK808Ab1am3c1X01IMyQIjbNaSWWOanE2FByJ/Gy8QSGdvWbR0gR5vev+WfHCJmpFHn4jQ==
X-Received: by 2002:a17:90b:805:: with SMTP id
 bk5mr2230390pjb.78.1605670564250; 
 Tue, 17 Nov 2020 19:36:04 -0800 (PST)
Received: from chromium.org ([100.99.132.239])
 by smtp.gmail.com with ESMTPSA id y25sm22603181pfn.44.2020.11.17.19.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 19:36:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1605638415-24776-1-git-send-email-khsieh@codeaurora.org>
References: <1605638415-24776-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 17 Nov 2020 19:36:02 -0800
Message-ID: <160567056210.60232.5628804791726356039@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: fix connect/disconnect
 handled at irq_hpd
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
Cc: rnayak@codeaurora.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-11-17 10:40:15)
> Some usb type-c dongle use irq_hpd request to perform device connection
> and disconnection. This patch add handling of both connection and
> disconnection are based on the state of hpd_state and sink_count.
> 
> Changes in V2:
> -- add dp_display_handle_port_ststus_changed()
> -- fix kernel test robot complaint
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 26b8d66a399e ("drm/msm/dp: promote irq_hpd handle to handle link training correctly")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
