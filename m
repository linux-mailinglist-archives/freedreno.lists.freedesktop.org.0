Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38DD671092
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D3C10E62F;
	Wed, 18 Jan 2023 02:06:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3129F10E62F
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:25 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v30so47710404edb.9
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=04yt4xQQnP6dtAFyamorFDli5j18JC4M48HBXJbEbHY=;
 b=HI9f++1UNXYSemQX1hiRHDg52hCshzdQeQ49dI9inGJXYUSByO6/WHrHEn6aUov9Z0
 woCXty+Gr+WSNWODYzczAXW7pttpln+6Wo32fNKlzpl+ABBqKedSzbJV+luCus6y+ylq
 tTOXrNAZmvStNPPrVLAD2mzhXQc2Ng7F04encX4+rdR08fPkIOYu8jpWKU3LZ7zMsgFG
 z3AlxLI8iAXkXDRgMf7jOpq2egayOpk+4Soe9Bn/KP5b3FTqDkkyQ0IkYcLrV7QiucaJ
 xOoK7bUVMbVEAkU5OCYNXheSbVh7VGBVFNT78j2cPZBcuu3IxfCNGIpKf7XFBPHsQodv
 ejWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=04yt4xQQnP6dtAFyamorFDli5j18JC4M48HBXJbEbHY=;
 b=7mB+ODOPU45FgGduMU6C6q+a5FNa+YuDbulpJul93qkw9lo5zDjKoq3CTfKXB2nIOO
 8z+COgD8Hzg8DkGibR+kkgVINc9oEv4hnQFSFxjoq4WAomaXuy1d+EL+ZYpiw8PkHRdt
 lxHKZkE8ui3FrJe7Updc0dsRJFWCALXqMt6VeeBJD95OVFtltsGsJe0pE5dY1bCdaJ7W
 /GSnkQL+69cNtBX0U9vSSv2Q6oHWnho/UUm5QzjcSZND1stNtyOD/zI5PO6uHS6rgR0u
 d7TeMX5aXJHSgLHkgDL5VGuJOzFk+x833ToLFpmK/tuZtvP3B6JnOKQ9XZ8f2e20A1G7
 akIA==
X-Gm-Message-State: AFqh2krISpbSfVSPEEFfuYfT/k4vS3TVOBI7IBKzrlW0koVZEAry7rMu
 ReVtuLQPtnIjezaeadV/1eNa9g==
X-Google-Smtp-Source: AMrXdXsBm3c0/1SvoATEKrB2V2Ccdr0KVPvkZK2NVqaD4EJEhMF5BSbtB3jAe4+zL9U5yrvoPppSYQ==
X-Received: by 2002:a05:6402:e9f:b0:49a:f52f:eed0 with SMTP id
 h31-20020a0564020e9f00b0049af52feed0mr5406382eda.13.1674007583732; 
 Tue, 17 Jan 2023 18:06:23 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 18 Jan 2023 04:06:06 +0200
Message-Id: <167400670529.1683873.13012274230061226169.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
References: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v8 0/3] mdss-dsi-ctrl binding and dts fixes
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 swboyd@chromium.org, airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 16 Jan 2023 22:52:14 +0000, Bryan O'Donoghue wrote:
> V8:
> - Squash first and last patch to fix bisectability
> 
> link: https://lore.kernel.org/linux-arm-msm/167388664232.594279.4607492026981202284.robh@kernel.org/T/#u
> 
> V7:
> - The bulk of the patches for this series have been merged.
>   There are still four patches to be pushed/updated.
> - Adds clocks for msm8974 - Dmitry
> - Adds compat strings for sm8150, sm8350, sm8450, sm8550 - Dmitry
> - Changes last patch in series to state - Rob
>   compatible:
>     contains:
>       const: qcom,mdss-dsi-ctrl
> 
> [...]

Applied, thanks!

[3/3] dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e0c2a96cc939

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
