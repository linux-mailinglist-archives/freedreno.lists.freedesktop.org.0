Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71FD2E9139
	for <lists+freedreno@lfdr.de>; Mon,  4 Jan 2021 08:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F06089B33;
	Mon,  4 Jan 2021 07:40:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B641F89B20
 for <freedreno@lists.freedesktop.org>; Mon,  4 Jan 2021 07:40:34 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id q4so14098841plr.7
 for <freedreno@lists.freedesktop.org>; Sun, 03 Jan 2021 23:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gkO4wZs2FgdAnD1CSmbghKQqG0ttWfnbDgOBZn/+SK0=;
 b=D6+RF/PzRVYdDbp9mVXRZkgt05lZoa0HdRGJaUPrO11l6JEOewUo9sGrnKJp0JNgxX
 4POzjUouMSaEkJq2p27xDPvg+5ijWyEmdf5pnItczrPqK51OZNq7N5eq6OIoVluRZbjF
 creiG91y37GlocoV+MNhmAx4dcHTrwnsIEG6/A6vysRbuchsfHe7/gGt/dBIgmpS2Wzw
 /e70y98Vovryj6fJVpAteYFt6iBaZlm3OKQOKIEBLSkkk515hA6eKIcl+kncJbYdnATE
 DVyx+eTJWdSzWYY1JNH1ppkIdH3q1uEt2C2YgSlh24A3+oyYw+8NCHxgIKFT1XAj/Cxz
 BZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gkO4wZs2FgdAnD1CSmbghKQqG0ttWfnbDgOBZn/+SK0=;
 b=pCu/B+CCms3SyRpaodsA3VoVtFwbafUtoRBCeKraBQzoPB8uaIlATafuzPjCXDy5JB
 KaaDf2+/918juW+7xGmMQlgQ4QPImOGJr3nujpPR7B+a/25UwXp18KrssJW6/ZXcYeEv
 bSt4BVHYMyzzPkK47mFGXNejCXY/TDQH0aL3HO+RAQgchjCTdMYXNhmJigTDFPBpDulM
 WyBzVU2GJtWl5rSXQYS2tY6+Dcc4+UX1w9/o8yPgEdB2uCuxibaIwevCg7Ma2ODlKmaB
 eUg5uMf6yCwa93S76AgjhUduahV8HAyAuTTmUOS77YWhFauygGJHEH+xUmufhcTdR6Y+
 A6xQ==
X-Gm-Message-State: AOAM533g4Hj0lEctjwSJfE40GlGlOA9muYRmc7VLd9rJKky/QzRRA3Ep
 Usk2TJ3PHmCxdjJ8zuEoDkMEVw==
X-Google-Smtp-Source: ABdhPJyzODUMq/AyS4aF5tDIj0lxzfRVSiJgpUf3lUkc6Hi0IU7ZVuxe+GHkfVxWnfCCseGDVj9amA==
X-Received: by 2002:a17:90a:4817:: with SMTP id
 a23mr28191220pjh.16.1609746034333; 
 Sun, 03 Jan 2021 23:40:34 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id b18sm55749806pfi.173.2021.01.03.23.40.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jan 2021 23:40:33 -0800 (PST)
Date: Mon, 4 Jan 2021 13:10:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Message-ID: <20210104074031.k7njtbjot4r22flb@vireshk-i7>
References: <20210103035706.24168-1-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210103035706.24168-1-tiny.windzz@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Subject: Re: [Freedreno] [PATCH 31/31] PM / devfreq: convert to
 devm_pm_opp_register_notifier and remove unused API
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03-01-21, 03:57, Yangtao Li wrote:
>  Use devm_pm_opp_* API to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/devfreq/devfreq.c | 66 +--------------------------------------
>  include/linux/devfreq.h   | 23 --------------
>  2 files changed, 1 insertion(+), 88 deletions(-)

Remove the unused stuff in a separate patch and let this layer keep
doing the devm thing, I don't think others would need it.

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
