Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7801D33852E
	for <lists+freedreno@lfdr.de>; Fri, 12 Mar 2021 06:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4296E120;
	Fri, 12 Mar 2021 05:27:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E5A6F41A
 for <freedreno@lists.freedesktop.org>; Fri, 12 Mar 2021 05:27:02 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id o38so15117245pgm.9
 for <freedreno@lists.freedesktop.org>; Thu, 11 Mar 2021 21:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=J5fqwubZg87avI0rRtQwN+SXtjOKj2+8RaJp62TnkpA=;
 b=mf2lohOPVRGidobqklbZjn3Xnmn4GilOSAPz/Es4rZMVhvRFW16qKSvJwGxacizmDM
 tT+ibJwyDMj0dZ0QwtMsGsshtI9JpOBj3AoJvLaAxuhaZ4HL6tkdafRXi5HPx8aFNxZ7
 4/jSQSqTdf3ieXs01o99B+bOnXCH2Vj1q5a3kEifOFtvDASGY1G+OFDLlWG+R79T9q7h
 sdjbwjQxL/4vjj48pT1ohmJzSy1nFnAXg+AW9fFrnh+JpHsKDI6C6jrmli1PwCO/6P9O
 ggAmfg1YDpRtAAdzDL+kVupEn08FqGF4jO3q4TaMYNg5dJBZY8ewfS1R7G6SA7fUhvy0
 ssOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J5fqwubZg87avI0rRtQwN+SXtjOKj2+8RaJp62TnkpA=;
 b=OyrfDQ8yEzh0Js2Vdqu6O8+cRGf4uJG0cqMII+4TXVUIQ4BwYRAthPnnEfZ82YeFCl
 W0+M/xd6i0WZEu67wUNxZW92tl4///BnZ3tq9vDQm1sxJ5pQi1KuR1zgb1lnN1ANxzyb
 ZXdIhq2uz24iR1PFM6CmdmpaBfWhDDurL5keL7b4BkJXj07+LKh1lute4niGWtcS4SzN
 eH+/Yf4CRQ5z4Iw/w6LYRqO4lsdxHDiDNV+kPs1eAgX31pZKK/k0wdtabX/iiiTbqHRY
 8SRAgMUjX97SSpd5P6zL71eWrGuaokiC4utZ2KHZ6XMpQjOFYRFHdCs9pgDmGpqfVTCo
 tMsw==
X-Gm-Message-State: AOAM531OGJytVE0QX9bjaGxy459cb2VCvxs5s2iXZVCAI5+UtAtn30NB
 zcIXdX82eH8K8EITPLJ+jC13pA==
X-Google-Smtp-Source: ABdhPJxSydG1zZQdQJipt4kFNAl189iLlI7sOzPMgqns7aTDEbaSzTwo9QPnHQ8GgoEZNmcDOq5YJA==
X-Received: by 2002:a62:84c3:0:b029:1f5:8dbf:4e89 with SMTP id
 k186-20020a6284c30000b02901f58dbf4e89mr10615120pfd.49.1615526821953; 
 Thu, 11 Mar 2021 21:27:01 -0800 (PST)
Received: from localhost ([122.171.124.15])
 by smtp.gmail.com with ESMTPSA id a144sm4185197pfd.200.2021.03.11.21.27.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 21:27:01 -0800 (PST)
Date: Fri, 12 Mar 2021 10:56:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20210312052659.uih7ikjdnkc5kl4j@vireshk-i7>
References: <20210311192105.14998-1-digetx@gmail.com>
 <20210311192105.14998-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311192105.14998-6-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Subject: Re: [Freedreno] [PATCH v2 05/14] opp: Add devres wrapper for
 dev_pm_opp_register_notifier
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
Cc: Nishanth Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-spi@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org,
 lima@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Viresh Kumar <vireshk@kernel.org>, Steven Price <steven.price@arm.com>,
 Andy Gross <agross@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-serial@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11-03-21, 22:20, Dmitry Osipenko wrote:
> From: Yangtao Li <tiny.windzz@gmail.com>
> 
> Add devres wrapper for dev_pm_opp_register_notifier() to simplify driver
> code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c     | 38 ++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_opp.h |  6 ++++++
>  2 files changed, 44 insertions(+)

As I said in the previous version, I am not sure if we need this patch
at all. This has only one user.

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
