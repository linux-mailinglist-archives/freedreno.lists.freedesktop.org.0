Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01BF67589F
	for <lists+freedreno@lfdr.de>; Fri, 20 Jan 2023 16:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACDC10EA52;
	Fri, 20 Jan 2023 15:32:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC19010EA52
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 15:32:49 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-4d59d518505so77695497b3.1
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 07:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9IPtDJM5M6jGN6qD0tP24K72UIm4iRXYGKWNFo7x72g=;
 b=SPoq6nBK/JeShjz0kPsSHbBdOJtV/AmVLorEPqTuGDzC70Ow5DX8doU0rsRDKCcTD1
 Jltcq/okn/fjqBisJ9sE69yh3amFyHgGDIqt3YyHdPR0N6qepAWxsS2OMETpUksYGV1S
 kwvgHr7iyU+Zf8HqHBuJwD0xp+BnLHmYnP0u3hdglzpy03kUEls0HWOct6IEtaAqANmb
 Q+V1t217x323JxoCLe6IfUbqtk4A/Ytth5Y1OutLyazCII9UdOCnZNL5iFxHvuAhrIPK
 3bwvEBE3iFXfMvlRByIuUpVcNW3pdXTUVnZ8yCJLWxGQb/RIggDxCRemoyzqpl81n21X
 kMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IPtDJM5M6jGN6qD0tP24K72UIm4iRXYGKWNFo7x72g=;
 b=cFcBB/lB6RaAi4BauNF0KOdUno4E8d0QDyunpOOytYdzxMmiyv40Qj3ccD0JTza6tw
 Cp05BCi3Gml4qcQMJH9nFPm02XMiMQOR/hkhgSwgQp3Odv/mRvWP8S/csDl20BEk+jPK
 Av+kUqX8G7nWqA9+cT8dxJfhGh0L8kCwam+hqtQn6aQk4LHCigxpm4YlZjeN5qBQcGG7
 SvghqCzPXw1X9hokoZK9L3E8KXaxp3wQkhAYgTMHbSXEe/w/QFeGVz2jS+mC0VIvB6+4
 jU1UAQ+g919PuyTc3JCvOWDqh17eiMwkxXTQYcz/1D8ERGB8OlzUbUmtcEvKp8+NRnbY
 1BsQ==
X-Gm-Message-State: AFqh2kpfp6N4GuVlxebhClohR3uWFEtyN0TYqg7L/B2qalIOhnnG08FR
 7y2sqUihvratlcaHweCeAMdF9w==
X-Google-Smtp-Source: AMrXdXtru88v2k61i9cQGS6ax35vAmCsXdW2DZPSz/qrSHebfuajOctI7UdN7zUMawsmB7qZX4N0+w==
X-Received: by 2002:a0d:d610:0:b0:3af:2118:fc34 with SMTP id
 y16-20020a0dd610000000b003af2118fc34mr11723672ywd.34.1674228768750; 
 Fri, 20 Jan 2023 07:32:48 -0800 (PST)
Received: from localhost (200.234.86.34.bc.googleusercontent.com.
 [34.86.234.200]) by smtp.gmail.com with ESMTPSA id
 j20-20020a05620a289400b006fed58fc1a3sm26448188qkp.119.2023.01.20.07.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:32:47 -0800 (PST)
Date: Fri, 20 Jan 2023 15:32:47 +0000
From: Sean Paul <sean@poorly.run>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <Y8q0H7SiDkdfmyXP@art_vandelay>
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-2-markyacoub@google.com>
 <67170ce0-8622-8b35-e73a-7d873b7a3b8b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67170ce0-8622-8b35-e73a-7d873b7a3b8b@linaro.org>
Subject: Re: [Freedreno] [PATCH v6 01/10] drm/hdcp: Add
 drm_hdcp_atomic_check()
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
Cc: quic_sbillaka@quicinc.com, imre.deak@intel.com,
 joonas.lahtinen@linux.intel.com, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 arun.r.murthy@intel.com, krzysztof.kozlowski+dt@linaro.org, airlied@gmail.com,
 hbh25y@gmail.com, ville.syrjala@linux.intel.com, marex@denx.de,
 ashutosh.dixit@intel.com, matthew.d.roper@intel.com, abhinavk@codeaurora.org,
 javierm@redhat.com, quic_khsieh@quicinc.com, stanislav.lisovskiy@intel.com,
 agross@kernel.org, quic_jesszhan@quicinc.com, ankit.k.nautiyal@intel.com,
 devicetree@vger.kernel.org, lyude@redhat.com, tzimmermann@suse.de,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, lucas.demarchi@intel.com,
 quic_abhinavk@quicinc.com, jani.nikula@linux.intel.com, swboyd@chromium.org,
 robh+dt@kernel.org, christophe.jaillet@wanadoo.fr, jose.souza@intel.com,
 rodrigo.vivi@intel.com, bjorn.andersson@linaro.org, sean@poorly.run,
 johan+linaro@kernel.org, tvrtko.ursulin@linux.intel.com,
 Mark Yacoub <markyacoub@chromium.org>, andersson@kernel.org,
 linux-kernel@vger.kernel.org, swati2.sharma@intel.com,
 manasi.d.navare@intel.com, robdclark@gmail.com, daniel@ffwll.ch,
 bhanuprakash.modem@intel.com, dmitry.baryshkov@linaro.org,
 seanpaul@chromium.org, freedreno@lists.freedesktop.org, maxime@cerno.tech
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 11:37:52AM +0100, Krzysztof Kozlowski wrote:
> On 18/01/2023 20:30, Mark Yacoub wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > This patch moves the hdcp atomic check from i915 to drm_hdcp so other
> > drivers can use it. No functional changes, just cleaned up some of the
> > code when moving it over.
> > 
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-2-sean@poorly.run #v1
> > Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-2-sean@poorly.run #v2
> > Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-2-sean@poorly.run #v3
> > Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-2-sean@poorly.run #v4
> > Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-2-sean@poorly.run #v5
> 
> It seems all your previous versions were sent not to correct people and
> lists. Therefore we see it for the first time even though it is v6! 

Hi Krzysztof,
Thanks for your review comments.

Here are the addresses the last version was sent to, who is missing?

To: dri-devel@lists.freedesktop.org, 
    jani.nikula@intel.com,
    intel-gfx@lists.freedesktop.org,
    freedreno@lists.freedesktop.org,
    rodrigo.vivi@intel.com
Cc: bjorn.andersson@linaro.org, 
    swboyd@chromium.org,
    abhinavk@codeaurora.org,
    markyacoub@chromium.org,
    Sean Paul <seanpaul@chromium.org>,
    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
    Maxime Ripard <mripard@kernel.org>,
    Thomas Zimmermann <tzimmermann@suse.de>,
    David Airlie <airlied@linux.ie>,
    Daniel Vetter <daniel@ffwll.ch>,
    Jani Nikula <jani.nikula@linux.intel.com>,
    Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
    Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>

> It's
> not the first such weird CC list in chromium, so maybe your
> organisational process could be improved? Not only for you but for
> colleagues as well, so you all start using get_maintainers.pl on newest
> kernel (not something ancient)?

I can't really speak for others, but I use MAINTAINERS from drm-tip. The 
previous patch sets were sent before 24df12013853 ("MAINTAINERS: Add 
Dmitry as MSM DRM driver co-maintainer"), which might explain why you think
there are absences?

Thanks again,

Sean

> 
> Best regards,
> Krzysztof
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
