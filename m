Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4186C7465DD
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 00:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E27010E246;
	Mon,  3 Jul 2023 22:54:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B7510E246
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 22:54:47 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-be49ca27e1fso5496444276.3
 for <freedreno@lists.freedesktop.org>; Mon, 03 Jul 2023 15:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688424886; x=1691016886;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xn7vrbu5PqDTl7a51t/U7fc8ZrLjhxJkWnIqrCoiU4U=;
 b=JHDhTSNEp+9zhQtG4YcXd+5itchw7KMtzGCR/WqbH/Wo9oyj0oTY8/OB7a3E424ODh
 kKOFrBha6pLgOIVALJUWPSfARD/WeIFBBhRyZArS2vXBEk3WTZA3uMH5oO820xDX+PXh
 h2Z5gk3ut/1EnUagV/DSqR5/64A5hIlCkuNcuX1dJknUf/5JzR7SLgiyhSD/2fbIeBVF
 2BwhNXrqoEtVV6A8mxb/HGtPf1obvpvtLI90Ree+1NVNBl9J352ZshZxqHFjuiTxg3bJ
 Tt0uYqGBsktC9EUxRz+Wwu+gE6Te8sPujyWQFnBXgRxWsQMRiNHFEqClkEKSkVA9ja4E
 5rIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688424886; x=1691016886;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xn7vrbu5PqDTl7a51t/U7fc8ZrLjhxJkWnIqrCoiU4U=;
 b=XbvGAunWme5v5lwu4g4dj2BIJgWau6PuGHdccqDY2GAZB81C33XyJVMO0v/qHALMjY
 wBUPysYZBNb0I6pXXBGW7RiES2QZAxKcqhU9cheIup9oZLTlZ/Io8aZqccUHIvTFsgbB
 J4vV8wEKQ9ULUGTc4EkGQbD2Wvo1YCeY7Zd9mTox1Z083zK6ZeMEAuc5mfVUQ5RWPFuC
 4wiIb/1/gzJrpW2HPhIWzLki//vvFZeoL59vKvfTD0HZaKRKJgR2K7U5N408MP+T+29F
 8Y8BeK1arZ4APllwneO/pFeYqWmJj5mGjJ7UzTV1DhkyiTErdou57BAfsbKVqIQLlipk
 O60w==
X-Gm-Message-State: ABy/qLb/hUUpyi0sBtqrvWSU5zLpRpC05WOyjJZWgKml/2P9G0VN8I0C
 tpz1oKPYFySCByRlm3IoCuc54tiUTv86OAlwPAB6Gg==
X-Google-Smtp-Source: APBJJlEouuF8/0ggK2G6w3HPfixNJv2NGicX8j6nANc49QLXr6neO8qeecRq3vcwS8pbfEtDLyvY14QIupaAIiJQacY=
X-Received: by 2002:a25:d0e:0:b0:c19:d3e:f629 with SMTP id
 14-20020a250d0e000000b00c190d3ef629mr10625615ybn.58.1688424886624; 
 Mon, 03 Jul 2023 15:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
 <20230628-topic-refgen-v3-4-9fbf0e605d23@linaro.org>
In-Reply-To: <20230628-topic-refgen-v3-4-9fbf0e605d23@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 01:54:35 +0300
Message-ID: <CAA8EJpp3TaNikf7=y1AS7vM99jHEKYS0Cmy2AbqUAx3DvYmovA@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 4/4] drm/msm/dsi: Hook up refgen regulator
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 3 Jul 2023 at 21:16, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Consume the refgen supply on configurations that may use it.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed--by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
>  1 file changed, 2 insertions(+)

-- 
With best wishes
Dmitry
