Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1618559CB7E
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 00:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB36196AD3;
	Mon, 22 Aug 2022 22:31:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B5890479
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 22:31:11 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 h20-20020a056830165400b00638ac7ddba5so8686592otr.4
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 15:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=Uze3mrVtxDFOcmt/i3yDaS8brRCL06O+UHridDKP8uo=;
 b=ZKpYpsYM/o2jCq4rm/aUeXUa93Rb0CMhl5VbaCfX6JMtiO3ennKIUovhafoX45YR9l
 i3Tep+H3h7UvRRZ4u6KuS+r3OCLFJjf2mIeEoenknI403RvbYjGG/kcs2lW5Mlp7iMu0
 9tbEi1zXfALiNre8cHiCTtHyOo/AReyfMAIWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=Uze3mrVtxDFOcmt/i3yDaS8brRCL06O+UHridDKP8uo=;
 b=QNe0U86mP46KmCSuVJydBeNmIO34CoX1n1sodP19Ln11NBHuFlrut4UdAkNfZQ0Yio
 5PY96rbJT+9kZ6UROff0drx+rszN4i4YqeAPj0oGSnegCrHpDZvKLeN270QltSY5Yor3
 F3INHwYtNvJlGvbsvPengIuB4snWkTmbowOJ+8yBrBXHJQ56jMPse4Omb02ehTIiW/uD
 Y7+lQOB0FXs7A73Z5UIm1Dfv6/XZjyPf4FeYDBUsJJXJB/mBAXi8y2fIB1g2kepSbqm7
 sIszdHte0UW/S5ZxulxxVXFVNR06YGFabuFlYsJPjhnbKgof7SH5BoHGX6VBifZtjzYt
 b4eA==
X-Gm-Message-State: ACgBeo0iopZaLJ+RptdmKLHylOKOKwxylfVAFxUwTkwqjE7mYFrhFNVG
 Ngn9LqM2SAFaq0k7x5LpHkqjmjPcAmkIwBmjw23hYA==
X-Google-Smtp-Source: AA6agR5yVAK+oIZ1GWb2i1iV3WJcnW9FOaXtzHjX2k5tPGFm581PTcReO2HhFtk6zsZQzHNkTiKAHHtDQDlSEEXMb0o=
X-Received: by 2002:a9d:53cb:0:b0:637:1ddc:615c with SMTP id
 i11-20020a9d53cb000000b006371ddc615cmr8858507oth.3.1661207470142; Mon, 22 Aug
 2022 15:31:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 17:31:09 -0500
MIME-Version: 1.0
In-Reply-To: <20220710084133.30976-7-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 17:31:09 -0500
Message-ID: <CAE-0n53rQ-_3wgH-QDyVnMhja2LW0_2nLUdy==6wQOTP9VA36g@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 6/9] arm64: dts: qcom: sc7280: drop
 unused clocks from eDP node
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-07-10 01:41:30)
> The eDP node includes two clocks which are used by the eDP PHY rather
> than eDP controller itself. Drop these clocks to remove extra difference
> between eDP and DP controllers.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
