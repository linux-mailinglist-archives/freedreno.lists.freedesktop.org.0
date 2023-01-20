Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0FD675EF6
	for <lists+freedreno@lfdr.de>; Fri, 20 Jan 2023 21:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D326B10E139;
	Fri, 20 Jan 2023 20:33:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C7110E120
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 20:33:51 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id n5so6729899ljc.9
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 12:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6a1CsEt8CudzRfvBnwyGdGse2R0fVkuKsLbjSK3W3ZU=;
 b=BV4fyxZgFNPW/IkcBFL26ouEsyGDHeRDZG+9LaXTS9UmerEGGQKt8zSbntQy6f70Ee
 DLFKPt4Ecx2aFtqeP66leWda/QaPgnyvwyvs0F2PEME9O2F7dU425QOhtLUktr9DHz45
 mJoISy2zum6vUbvBGLxP65OznjqVzj4BrHB+hXTfxQudiviaVX7OodTaOtNk12l463Eh
 34aLCeGzHfmm35Z2aO+do5+1C2o0wxgnoiSRZwXLYXZgIyu+Zgc/zypkoYvaEHMtFoZy
 1PudTMMcf+ygD/aB3VrnDYcwDR6zNmtKRCxKjjkxBCL+nHWswnVnaPa1EDCarbaySvWD
 McDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6a1CsEt8CudzRfvBnwyGdGse2R0fVkuKsLbjSK3W3ZU=;
 b=CVtKIUJe5AlmYCM/tSuxJ00qhIctcKIxQ7JLCwR1wqzEj++LyxiAxCsVL0mvxYhPun
 mz7X+rzPnQbEPc5G4svKwvLnpkc/gz1ZHI4wsIWAGPGMfXybAUWkprf7DEiJzt/WwcQm
 Az9vz5zoe81tg2SYb5At4LLgLNglIlEV2/OMjyximwmdQQVYTc8mUGVenGFOfIDdMz+E
 hlv0o1u2IqnmwOCsic6sW2oOfpJb4apbaCV+noXoMuFmmucaxlio+6gNEqyUPPrWH5cY
 DecnVznx4ZC7f4aeKqT7PRqjPS2i3/bP3SFBwTZ2l9HmlMuGNH2ql2XtUUK5fKsS+euB
 uFiA==
X-Gm-Message-State: AFqh2kpFjgzKb50P/lsvod92X/Qup1WROG5l8qe8Gu1cQ9cVO0A7O+If
 AhT62kmfHtpUGVbJyb7MZpG1pw==
X-Google-Smtp-Source: AMrXdXseY041EcoBVjr8I7TjlaoEgXg0O09aGRO1387zhmObbC/gygm6bg9SKzzA3KsLfgKlsqBVYg==
X-Received: by 2002:a2e:9ecb:0:b0:283:ce76:415b with SMTP id
 h11-20020a2e9ecb000000b00283ce76415bmr4760051ljk.29.1674246829689; 
 Fri, 20 Jan 2023 12:33:49 -0800 (PST)
Received: from [127.0.0.1] ([188.162.65.44]) by smtp.gmail.com with ESMTPSA id
 k6-20020a05651c10a600b00287d9d49939sm3518968ljn.81.2023.01.20.12.33.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Jan 2023 12:33:49 -0800 (PST)
Date: Fri, 20 Jan 2023 23:33:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
User-Agent: K-9 Mail for Android
In-Reply-To: <Y8q0H7SiDkdfmyXP@art_vandelay>
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-2-markyacoub@google.com>
 <67170ce0-8622-8b35-e73a-7d873b7a3b8b@linaro.org>
 <Y8q0H7SiDkdfmyXP@art_vandelay>
Message-ID: <A0271342-FB1E-4F7C-BD94-7506F4FACE6E@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 bhanuprakash.modem@intel.com, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org, maxime@cerno.tech
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 20 January 2023 18:32:47 GMT+03:00, Sean Paul <sean@poorly=2Erun> wrote=
:
>On Thu, Jan 19, 2023 at 11:37:52AM +0100, Krzysztof Kozlowski wrote:
>> On 18/01/2023 20:30, Mark Yacoub wrote:
>> > From: Sean Paul <seanpaul@chromium=2Eorg>
>> >=20
>> > This patch moves the hdcp atomic check from i915 to drm_hdcp so other
>> > drivers can use it=2E No functional changes, just cleaned up some of =
the
>> > code when moving it over=2E
>> >=20
>> > Acked-by: Jani Nikula <jani=2Enikula@intel=2Ecom>
>> > Acked-by: Jani Nikula <jani=2Enikula@intel=2Ecom>
>> > Reviewed-by: Rodrigo Vivi <rodrigo=2Evivi@intel=2Ecom>
>> > Reviewed-by: Abhinav Kumar <abhinavk@codeaurora=2Eorg>
>> > Signed-off-by: Sean Paul <seanpaul@chromium=2Eorg>
>> > Signed-off-by: Mark Yacoub <markyacoub@chromium=2Eorg>
>> > Link: https://patchwork=2Efreedesktop=2Eorg/patch/msgid/2021091317574=
7=2E47456-2-sean@poorly=2Erun #v1
>> > Link: https://patchwork=2Efreedesktop=2Eorg/patch/msgid/2021091520383=
4=2E1439-2-sean@poorly=2Erun #v2
>> > Link: https://patchwork=2Efreedesktop=2Eorg/patch/msgid/2021100115114=
5=2E55916-2-sean@poorly=2Erun #v3
>> > Link: https://patchwork=2Efreedesktop=2Eorg/patch/msgid/2021110503043=
4=2E2828845-2-sean@poorly=2Erun #v4
>> > Link: https://patchwork=2Efreedesktop=2Eorg/patch/msgid/2022041120474=
1=2E1074308-2-sean@poorly=2Erun #v5
>>=20
>> It seems all your previous versions were sent not to correct people and
>> lists=2E Therefore we see it for the first time even though it is v6!=
=20
>
>Hi Krzysztof,
>Thanks for your review comments=2E
>
>Here are the addresses the last version was sent to, who is missing?
>
>To: dri-devel@lists=2Efreedesktop=2Eorg,=20
>    jani=2Enikula@intel=2Ecom,
>    intel-gfx@lists=2Efreedesktop=2Eorg,
>    freedreno@lists=2Efreedesktop=2Eorg,
>    rodrigo=2Evivi@intel=2Ecom
>Cc: bjorn=2Eandersson@linaro=2Eorg,=20
>    swboyd@chromium=2Eorg,
>    abhinavk@codeaurora=2Eorg,
>    markyacoub@chromium=2Eorg,
>    Sean Paul <seanpaul@chromium=2Eorg>,
>    Maarten Lankhorst <maarten=2Elankhorst@linux=2Eintel=2Ecom>,
>    Maxime Ripard <mripard@kernel=2Eorg>,
>    Thomas Zimmermann <tzimmermann@suse=2Ede>,
>    David Airlie <airlied@linux=2Eie>,
>    Daniel Vetter <daniel@ffwll=2Ech>,
>    Jani Nikula <jani=2Enikula@linux=2Eintel=2Ecom>,
>    Joonas Lahtinen <joonas=2Elahtinen@linux=2Eintel=2Ecom>,
>    Tvrtko Ursulin <tvrtko=2Eursulin@linux=2Eintel=2Ecom>
>
>> It's
>> not the first such weird CC list in chromium, so maybe your
>> organisational process could be improved? Not only for you but for
>> colleagues as well, so you all start using get_maintainers=2Epl on newe=
st
>> kernel (not something ancient)?
>
>I can't really speak for others, but I use MAINTAINERS from drm-tip=2E Th=
e=20
>previous patch sets were sent before 24df12013853 ("MAINTAINERS: Add=20
>Dmitry as MSM DRM driver co-maintainer"), which might explain why you thi=
nk
>there are absences?

Current iteration of the patchset got at least three addresses wrong=2E Th=
ey have been changed for various reasons=2E Thus I also can suppose that th=
e list is incomplete and/or incorrect=2E

>
>Thanks again,
>
>Sean
>
>>=20
>> Best regards,
>> Krzysztof
>>=20
>

--=20
With best wishes
Dmitry
