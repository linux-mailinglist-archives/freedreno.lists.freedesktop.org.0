Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271C62768F6
	for <lists+freedreno@lfdr.de>; Thu, 24 Sep 2020 08:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA066EAAD;
	Thu, 24 Sep 2020 06:32:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865E76EAAE
 for <freedreno@lists.freedesktop.org>; Thu, 24 Sep 2020 06:32:14 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id y14so1268877pgf.12
 for <freedreno@lists.freedesktop.org>; Wed, 23 Sep 2020 23:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=QLnDNKE2S3wzGcgxQbn94gD4gMx4cWe6gJ0q+mzRl+Q=;
 b=a33jq1KwBVdBeHZ6vJ/PJDssGM/nkkdTZuwG6vxdqOkbpjhTUyZn7nvYMusycvTeUg
 l5vP/b8Wg0uPEOnvQJMVKhMFtkTEAX9gNC7BWHHxSbvR14Dj/1CQhKacpHoQsGrKu6P2
 IHpi6jXMAW7JYNPevhxHBR022uVslkdWxU4/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=QLnDNKE2S3wzGcgxQbn94gD4gMx4cWe6gJ0q+mzRl+Q=;
 b=dn1kQgvxZXF4kEDynqOuXlIw0tUgWOceNkd5GEDJ5llMIpvldhVO8STrF5GDvZCUna
 CrFXjuJ4lyMTYtt5DATAtG8KoSypY1CNmoiNbrXQDQBm6omxATG+d8Wx9TJ0KCfpoRna
 RDFrzMbDWFjkKx2d6hQjLFrGw43ry3Ur6yB+2UDybeJa8b6Og0Bc4r7xQbdOvqBEGzfk
 rqkrpN/LIEVea6XzET4LFcgCn1YlC+5SXBNLl32OdSaif9DhSc8vykdZ58rF6ViPk0yb
 wArE855fRvOmVO95QfEbCfbFsIsRAwT305axwon5ym04/HHegdfcJCdMF1hMQoz4f7VK
 xfcg==
X-Gm-Message-State: AOAM532mOGYUAB1IITZ72qTFzB3gVIIekIVwRKNjZjszUmYkh1SPCGWm
 YLSHbnDIfdfZJOGHchcovw849Q==
X-Google-Smtp-Source: ABdhPJzH1YjRbI7I1wZnL68bv9NNgPPGtLGQpYKz73xHcQIYGHEmTe5RXFL5RZ9shSJozYaiqwYClg==
X-Received: by 2002:aa7:8a54:0:b029:142:2501:34f6 with SMTP id
 n20-20020aa78a540000b0290142250134f6mr3022588pfa.79.1600929134015; 
 Wed, 23 Sep 2020 23:32:14 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id i9sm1584716pfq.53.2020.09.23.23.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:32:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200923232448.24516-1-abhinavk@codeaurora.org>
References: <20200923232448.24516-1-abhinavk@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
Date: Wed, 23 Sep 2020 23:32:12 -0700
Message-ID: <160092913200.310579.7777419545906412437@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: fix incorrect function
 prototype of dp_debug_get()
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, khsieh@codeaurora.org,
 robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2020-09-23 16:24:48)
> Fix the incorrect function prototype for dp_debug_get()
> in the dp_debug module to address compilation warning.
> 
> Fixes: f913454aae8e ("drm/msm/dp: move debugfs node to /sys/kernel/debug/dri/*/")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Will the compliance testing parts be moved out of debugfs at some point?
Just curious what the plan is there.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
