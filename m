Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D75172D8B
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2020 01:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764F46EDA2;
	Fri, 28 Feb 2020 00:43:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CDF6EDA2
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2020 00:43:31 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id i11so454069pju.3
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2020 16:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8t+QF1jUrbFLO8yI08wmjsR+GeHNrEjF1Md3xiMC8NA=;
 b=lhRclAojaWh7DXh2Fy7nrZd8SyMa2JcnmOKVrBR+FQiN1Mp028BI+MGpcddDUXGFCo
 JVM/kWmCyIpvTdqmy3Mp4rlnHT6E8MxWgHEdVS/cOIvQC91hdqRkEyRVVWVfhwxJ6h4X
 Gnc/1uU0weocAgDStM+BvrwkpxoNH/IGzP4P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8t+QF1jUrbFLO8yI08wmjsR+GeHNrEjF1Md3xiMC8NA=;
 b=Yf/hQMG1r0QIbebqUQmoxFqpSm/Pdz1RXFj3/ntbzAcptivFUYfx8EDvxSOQZ26ybT
 yA6GwC+i4rMwkygjMePlgKqqCawWkYl3PQbpAY56SFUnETYuQXuTIMdKC+i2O42gja4q
 rwDp/1tH/HEDQeHznP6d9I2vTbwR4I2ABuSiQwhiPjOf0QxeJ1F4nG9MgR7Mh+NNoxAg
 E10ukYZuYJkoRsa6xQx+Ty1+ody4+voLezs+NzzC9L5IBo4+ZFcfvzp89dN04WTGgP8w
 f3Vrw6jZ5nSIEZ/6maOFcn/TvaF2QCIh4fIFC3zA0xlSCm78TOpl127EUlgB+nKEZpzb
 d5uA==
X-Gm-Message-State: APjAAAWEUPPKwWE6Lcm/zK6n8siehwVhGcbCK/L6VEvJS0zZgrC5sLG/
 j2qdraOU2mI7kTQtB/MrfZ2kxQ==
X-Google-Smtp-Source: APXvYqwWMiiJ4fXkvydaOnQd5+1b2ygxswq4zp1nvGJdIdnG9xiMkdkUMdjzVxim7xA7gB0Eus81Qg==
X-Received: by 2002:a17:90a:8586:: with SMTP id
 m6mr1724274pjn.121.1582850610811; 
 Thu, 27 Feb 2020 16:43:30 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id 13sm7713961pgo.13.2020.02.27.16.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 16:43:29 -0800 (PST)
Date: Thu, 27 Feb 2020 16:43:28 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Chandan Uddaraju <chandanu@codeaurora.org>
Message-ID: <20200228004328.GM24720@google.com>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
 <0101016ec6df0e54-2af1f4a6-8f72-4799-89e0-0ff87b514eb2-000000@us-west-2.amazonses.com>
 <20200227215433.GK24720@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227215433.GK24720@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [DPU PATCH v3 3/5] drm/msm/dp: add displayPort
 driver support
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, hoegsberg@google.com,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 01:54:33PM -0800, Matthias Kaehlcke wrote:
> On Mon, Dec 02, 2019 at 01:48:57PM +0000, Chandan Uddaraju wrote:
> > Add the needed displayPort files to enable DP driver
> > on msm target.
> > 
> > "dp_display" module is the main module that calls into
> > other sub-modules. "dp_drm" file represents the interface
> > between DRM framework and DP driver.
> > 
> > changes in v2:
> > -- Update copyright markings on all relevant files.
> > -- Change pr_err() to DRM_ERROR()
> > -- Use APIs directly instead of function pointers.
> > -- Use drm_display_mode structure to store link parameters in the driver.
> > -- Use macros for register definitions instead of hardcoded values.
> > -- Replace writel_relaxed/readl_relaxed with writel/readl
> >    and remove memory barriers.
> > -- Remove unnecessary NULL checks.
> > -- Use drm helper functions for dpcd read/write.
> > -- Use DRM_DEBUG_DP for debug msgs.
> > 
> > changes in V3:
> > -- Removed changes in dpu_io_util.[ch]
> > -- Added locking around "is_connected" flag and removed atomic_set()
> > -- Removed the argument validation checks in all the static functions
> >    except initialization functions and few API calls across msm/dp files
> > -- Removed hardcoded values for register reads/writes
> > -- Removed vreg related generic structures.
> > -- Added return values where ever necessary.
> > -- Updated dp_ctrl_on function.
> > -- Calling the ctrl specific catalog functions directly instead of
> >    function pointers.
> > -- Added seperate change that adds standard value in drm_dp_helper file.
> > -- Added separate change in this list that is used to initialize
> >    displayport in DPU driver.
> > -- Added change to use drm_dp_get_adjust_request_voltage() function.
> > 
> > Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> > ---
> > +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> >
> > ...
> >
> > +int dp_power_init(struct dp_power *dp_power, bool flip)
> > +{
> > +	int rc = 0;
> > +	struct dp_power_private *power;
> > +
> > +	if (!dp_power) {
> > +		DRM_ERROR("invalid power data\n");
> > +		rc = -EINVAL;
> > +		goto exit;
> > +	}
> 
> drive-by comment:
> 
> this would lead to calling 'pm_runtime_put_sync(&power->pdev->dev)'
> below with 'power' being NULL, which doesn't seem a good idea.

correction: with 'power' being uninitialized, which isn't a good idea
either.

> It is probably sane to expect that 'dp_power' is not NULL, if that's
> the case the check can be removed. Otherwise the function should just
> return -EINVAL instead of jumping to 'exit'.
> 
> > +
> > +	power = container_of(dp_power, struct dp_power_private, dp_power);
> > +
> > +	pm_runtime_get_sync(&power->pdev->dev);
> > +	rc = dp_power_regulator_enable(power);
> > +	if (rc) {
> > +		DRM_ERROR("failed to enable regulators, %d\n", rc);
> > +		goto exit;
> > +	}
> > +
> > +	rc = dp_power_pinctrl_set(power, true);
> > +	if (rc) {
> > +		DRM_ERROR("failed to set pinctrl state, %d\n", rc);
> > +		goto err_pinctrl;
> > +	}
> > +
> > +	rc = dp_power_config_gpios(power, flip);
> > +	if (rc) {
> > +		DRM_ERROR("failed to enable gpios, %d\n", rc);
> > +		goto err_gpio;
> > +	}
> > +
> > +	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
> > +	if (rc) {
> > +		DRM_ERROR("failed to enable DP core clocks, %d\n", rc);
> > +		goto err_clk;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_clk:
> > +	dp_power_disable_gpios(power);
> > +err_gpio:
> > +	dp_power_pinctrl_set(power, false);
> > +err_pinctrl:
> > +	dp_power_regulator_disable(power);
> > +exit:
> > +	pm_runtime_put_sync(&power->pdev->dev);
> > +	return rc;
> > +}
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
