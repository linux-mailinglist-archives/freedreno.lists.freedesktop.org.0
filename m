Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DBE54FE91
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 22:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED62310E4CF;
	Fri, 17 Jun 2022 20:56:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B973C10E4F3
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 20:56:32 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-fb6b4da1dfso6949324fac.4
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 13:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=MH/iAqLtqToQAlEnXkpP3+J+Zy8At+koA/Z9dM2NOZc=;
 b=kyEDKtsqodmuTT86QxhNaU7tgoCtWme2N7wlYwiTpVGVYAYBBqt1DAq/mT9BFnwPWo
 bQ1PITdzjrSdMZlt5iD9XIjog5xhqmEIF916e+ohiHDHLGfApEbwoww3ZTPADsLwjxZ2
 TEwBBCfZPVd4+eGNaGntLIlezdWVPhYRn3l0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=MH/iAqLtqToQAlEnXkpP3+J+Zy8At+koA/Z9dM2NOZc=;
 b=EAqkxSB5wE+nHE4wmJEsmIqMvDBsdVu6yj85LArID7y8DPV8Xi39RdLyBlbRFAMcgV
 RfEhn048h/iKr95A18puVsyzvgJnVvmKfEQSLDJR6nBnR8q2KbWJ3rRDMuVPp0dgUvM6
 /MHDa7WxjLwrQtvY7ZIbufjcDQetX1nsXsVSJ6jjB0+tA/SipfQq1A9RdIytOtDySeNw
 Rx+n7tbVBhXVCMQzoItyDISLfbBsC4VgzBrhRzH6gN0ZwOQT0iAu+BXe7v0O/32Xuxl0
 I+5EKXA2AY+sz+Nujm9ZUaU6ZQx+njxay6iKLqdxhQsRNhQxL98MfD3hsvCnRJvFmBe6
 HjZA==
X-Gm-Message-State: AJIora9YMRWRdF6LdoDVyTLnloCEdKjSTXk2tI9nu0hcWwsM1PeZ5qlz
 lZyKNVSuX7Rb3gE1v9Ap9ITf9z0zz3pBmrRg8blT4g==
X-Google-Smtp-Source: AGRyM1vd690rXJ51SuzzgfI8BhKCCRgUEbObgJqZvik2f2hM6fajZLbLknhknAJbbPVwWpZOvXMPEzWPFbnPZniESuA=
X-Received: by 2002:a05:6870:b48a:b0:101:40eb:63a3 with SMTP id
 y10-20020a056870b48a00b0010140eb63a3mr6284144oap.193.1655499392048; Fri, 17
 Jun 2022 13:56:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:56:31 -0700
MIME-Version: 1.0
In-Reply-To: <20220617103608.605898-3-dmitry.baryshkov@linaro.org>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
 <20220617103608.605898-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:56:31 -0700
Message-ID: <CAE-0n53pK-YDLkBTyHiF_AL_BEdOjCAt2RdqLemONzVsXx+Asw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/hdmi: make hdmi_phy_8996 OF clk
 provider
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-17 03:36:07)
> On MSM8996 the HDMI PHY provides the PLL clock to the MMCC. As we are
> preparing to convert the MSM8996 to use DT clocks properties (rather
> than global clock names), register the OF clock provider.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
