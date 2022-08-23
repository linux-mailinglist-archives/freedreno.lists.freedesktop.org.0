Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77DD59EE1A
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 23:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AF010F9E7;
	Tue, 23 Aug 2022 21:21:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A722F10F9E7
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 21:20:59 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-11d7a859b3aso7141689fac.4
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 14:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=cE/HKSS1gcJ/bSLjCPtdvFIQrahyJdohXOdk9AJy+aE=;
 b=mdjPFrvRatkM6bSBrHyob39+vqOAM+OJ6yFbe7pKnEtneYvZ3AEyvA06mzPFI6C6xz
 b7wJf9XlaDnvGBReC4O4PjzPxfIqTp4enKLhhjyhON7LiW7T6rDerkr9nyN5k1uBDb7Y
 1V6kQ1zGUz+p+3DtkgHtsAB7vf+Cws/EsgFFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=cE/HKSS1gcJ/bSLjCPtdvFIQrahyJdohXOdk9AJy+aE=;
 b=BZK23IamH5f3jg01UB1WgOKw7VGQqMdOz60RUAMqscO3On+qogHOkrgY/6N96qlWn+
 6iRINnF3Y/hLetHoFAvdL6O9CBWHHg9t3o+0guhPRHIIXHh3Q0fanzFXq65cFIbmooet
 Ver8F1pETO6ck9ZmcN2d5EAgHeSisORfTOsrHlwjExsd1OiKdpo309lCfNlZge0TQ3hH
 biVfksE77SXXXDSJ/6wwXoJWvUbY388aXztfs6HuEHRxpJRVXCzjUSCap/TB70m0O3dr
 Xe15FPr7r2YGc64EZ3QV1jvwVmRxMMKzVNTZTukhO2Kn0GX2odx62Zxi4HrjM+LsUi6V
 UUgA==
X-Gm-Message-State: ACgBeo0HlnQmGTvsje4CppRU9y63vBE63pz22PTla1FeN6CHY1h1pl+A
 68HJQdOrTZsQT503xlCtMXVzcyoE0icRMDR2WNJQCw==
X-Google-Smtp-Source: AA6agR4QQoa2UfnPHO//dTdnEb86cOYZdqaGouJSF8NHaTF9PTibAwUV01BupM30k+6j+7cZ0tchO0CNdnY1ihMsSfc=
X-Received: by 2002:a05:6870:a99c:b0:11c:2c37:3d03 with SMTP id
 ep28-20020a056870a99c00b0011c2c373d03mr2264277oab.0.1661289658829; Tue, 23
 Aug 2022 14:20:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Aug 2022 16:20:57 -0500
MIME-Version: 1.0
In-Reply-To: <c8a2f675-4d69-58f7-a603-5e810f0077fe@quicinc.com>
References: <20220823024356.783318-1-swboyd@chromium.org>
 <c8a2f675-4d69-58f7-a603-5e810f0077fe@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 23 Aug 2022 16:20:57 -0500
Message-ID: <CAE-0n50YsdeipC=shDnhyTbHaCctGEmZixLKzcb4DyOng5QhWQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Silence inconsistent indent
 warning
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, patches@lists.linux.dev,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-08-23 10:47:02)
> link->request.test_lane_count;
> -       link->dp_link.link_params.rate = link->request.test_link_rate;
> +       link->dp_link.link_params.rate =
> +               drm_dp_bw_code_to_link_rate(link->request.test_link_rate);
>
>          return 0;
>
> Since we are fixing up this commit, can you please fix this too?
>

Sure.
