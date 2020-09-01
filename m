Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9C2258A6F
	for <lists+freedreno@lfdr.de>; Tue,  1 Sep 2020 10:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED956E834;
	Tue,  1 Sep 2020 08:38:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD546E834
 for <freedreno@lists.freedesktop.org>; Tue,  1 Sep 2020 08:38:15 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id w186so311288pgb.8
 for <freedreno@lists.freedesktop.org>; Tue, 01 Sep 2020 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sVtA4BoZtd+qYp70Vhjk25E1OWB6lKP1vnEo/fyHhLs=;
 b=SnQgHt594OnvLQ+HxoV+1b+xHTfWiZdjynemjFAeMz42JIh9tNJ12ru0Sdf87mOruN
 YIS2eu2r1BgbUmwZ5B6/xd2LkGoztpFrlWs8OA5BQTUysDWl9UFYPnuOpjogN4KbX2YR
 cKS6X66plUmYw9WLQnKQB2lbF41fKnPmq0ZAc4NUbGlb6lhiNtmG25L7KtxXA67rgAtq
 2BNfqsH4eLHVD18cv5Y0FLwxrPM2ZeN9ZVsrWYIVi7A8mp3/FYORXPRdo5jFVHPf8xtD
 JaHb7u2FUskbMnYCc+RlYKp/pNEoGHUdb790uRF8fS08FGQeaVWozJSDGsWLJt2fZCRE
 PsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sVtA4BoZtd+qYp70Vhjk25E1OWB6lKP1vnEo/fyHhLs=;
 b=C5/kaciUKW5aUFWbhGtTvwyISThZT5MwpCVpFpojQ6aKQDMrPHyWAFBpVAmh02YFN/
 +oQL9Mz64KcraJk9/4Gs6JBSzdmXp/JfeZJ3tEWh+8uPbzsYCh1zT1wGKB3VM2TRbSbt
 r8MvgeUttU/IGVZQyHIeldzSTlrM3a0r6eW04GD6ondaidSaKTYXoFixgEWieqVWAnM4
 mq8Nw4NBJW9k6TcHPWShRqWVnh9WcgZtsv2P9VI4NtrKazDN3qjrZ/QRkYZZyDjc+oVq
 symWHGSfjky416r7AQrOcWBDtivJHEBXPraLYQVhlP7V6h04EPbmskHJ+XLI/AYyNUnb
 0Z+w==
X-Gm-Message-State: AOAM533cJUQuSfmh8SegI4tEn4LSct23rSCicEODbWwFT6QELf+u9rUB
 Ip6OGOPOQ59JRYEn1xVo4ibfbw==
X-Google-Smtp-Source: ABdhPJwZHBfT3ETPIgNI5qRnnz8/BpmRAeI4KxWCHE2M6+mIYJNgUAe/wNWoWcH+xoGqRksqZeUjGg==
X-Received: by 2002:a63:ba49:: with SMTP id l9mr605427pgu.101.1598949495328;
 Tue, 01 Sep 2020 01:38:15 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id o6sm708807pju.25.2020.09.01.01.38.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Sep 2020 01:38:14 -0700 (PDT)
Date: Tue, 1 Sep 2020 14:08:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <20200901083806.a2wz7idmfce2aj3a@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
 <bc64e031-c42f-9ed2-c597-18a790a4d3bb@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc64e031-c42f-9ed2-c597-18a790a4d3bb@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Subject: Re: [Freedreno] [PATCH V2 3/8] drm/msm: Unconditionally call
 dev_pm_opp_of_remove_table()
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
Cc: Nishanth Menon <nm@ti.com>, freedreno@lists.freedesktop.org,
 Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01-09-20, 13:01, Rajendra Nayak wrote:
> So FWIU, dpu_unbind() gets called even when dpu_bind() fails for some reason.

Ahh, I see.

> I tried to address that earlier [1] which I realized did not land.

I don't think that patch was required, as you can call
dev_pm_opp_put_clkname() multiple times and it will return without any
errors/crash.

> But with these changes
> it will be even more broken unless we identify if we failed dpu_bind() before
> adding the OPP table, while adding it, or all went well with opps and handle things
> accordingly in dpu_unbind.

Maybe not as dev_pm_opp_of_remove_table() can be called multiple times
as well without any errors or crash.

> [1] https://lore.kernel.org/patchwork/patch/1275632/

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
