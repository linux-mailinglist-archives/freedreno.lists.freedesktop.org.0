Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A264BF1C
	for <lists+freedreno@lfdr.de>; Tue, 13 Dec 2022 23:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAA510E393;
	Tue, 13 Dec 2022 22:07:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FF610E377
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 22:07:46 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id j4so7395071lfk.0
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 14:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wHUnqLw96+ngp6Xno9gf3PyYozaeRIXvoO7s/Oinps0=;
 b=igrOr2o5GAVw2Rall5ObRaZUP4UxSsd7ZVPg2xSJ2ZpQc6D7BY6WC2vHNKs48xDiOn
 w94aMUby95vy7IaefMNGYJibV5azwMVVYeskonJDlwsJyisJqXSZ+YeaNp4J1zwDyuUa
 Xp83Z4YdwgpdSngFC53KmQDxF9qbpwQgjXKLIVS4k3s37eQx0OXnTnh8iRg6yS4suVos
 yfSfXAC+6rUt3QQFC99BVn8vkCRcXXWV0z6u+3gSG8ukI3+RzXBnm8lT720HezQEI6OZ
 F/P/rQvGesHQbGFzs4zCdigd0fUw0DDUDsjBEvB37XYSTurE+at0wokPvnN1YnaFJvG9
 xffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wHUnqLw96+ngp6Xno9gf3PyYozaeRIXvoO7s/Oinps0=;
 b=0P9WCSVmGneHc2mCeMX9C+dyxU3mCM98OfQyzpyURzqYaGYq4z1xXmyBwFMegWHoSJ
 znRBp2n6IffUKI0nWMa9h0J/b/eRJOu16l1r8/2rGZxgn4P1Bc3yc6cH7qKDtUaKTZFo
 YNp+u4t4nMn9srL5wrVBdBZqRVBG1nylleyto9RZl5g1972zy0OOuxzv7wAwgMIMjoCM
 dJf9tqda032DzHcnkpw2FTwhL2t5tTKAn2b3rdQi81B1pP3+PHIjlHA8XNRaIwXYBA8G
 DkROsygPqhMLK4KGRvKaoIkMpVdUazClM1Lh/59HFkIfI8gys3KFca6PuQk7RLbtI2Tm
 4Fow==
X-Gm-Message-State: ANoB5pnS+G/gDKOZFVLe6lqTdWMdEKkfAw5f1H4R7RoeIA4BBRbEu9ea
 kQRy4vBILrj2HM1uL22TG9qgBw==
X-Google-Smtp-Source: AA0mqf7ehK46F6iool0O7jW35L3u8rQcwD6kafvrqVI+B60Y6ZdK4Ce0X/YC0MCcDAh1XjizP0eE3g==
X-Received: by 2002:a05:6512:acf:b0:4a4:68b9:19f6 with SMTP id
 n15-20020a0565120acf00b004a468b919f6mr7176732lfu.30.1670969264760; 
 Tue, 13 Dec 2022 14:07:44 -0800 (PST)
Received: from ?IPv6:::1? (dzccz6yfpdgdc5vwjcs5y-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00:8c19:462c:c647:13f2])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a056512215100b00498f77cfa63sm526359lfr.280.2022.12.13.14.07.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Dec 2022 14:07:44 -0800 (PST)
Date: Wed, 14 Dec 2022 00:07:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@gmail.com
User-Agent: K-9 Mail for Android
In-Reply-To: <1670967848-31475-5-git-send-email-quic_khsieh@quicinc.com>
References: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com>
 <1670967848-31475-5-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <19FF7ADA-F116-4C0E-9930-617FF1EE3801@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v12 4/5] drm/msm/dp: parser link-frequencies
 as property of dp_out endpoint
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 13 December 2022 23:44:07 EET, Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>=
 wrote:
>Add capability to parser and retrieve max DP link supported rate from
>link-frequencies property of dp_out endpoint=2E
>
>Changes in v6:
>-- second patch after split parser patch into two patches
>
>Changes in v7:
>-- without checking cnt against DP_MAX_NUM_DP_LANES to retrieve link rate
>
>Changes in v9:
>-- separate parser link-frequencies out of data-lanes
>
>Changes in v10:
>-- add dp_parser_link_frequencies()
>
>Changes in v11:
>-- return 0 if(!endpoint)
>
>Changes in v12:
>-- replace khz with kbytes at dp_parser=2Eh
>
>Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>


Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>


>---
> drivers/gpu/drm/msm/dp/dp_parser=2Ec | 27 +++++++++++++++++++++++++++
> drivers/gpu/drm/msm/dp/dp_parser=2Eh |  2 ++
> 2 files changed, 29 insertions(+)


--=20
With best wishes
Dmitry
