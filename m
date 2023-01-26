Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E9F67D4F5
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 20:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C6D10E98D;
	Thu, 26 Jan 2023 19:01:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527D210E981
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:16 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qx13so7605792ejb.13
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A5OO1vXNMuogp5FzRqCMwDv1MFLEw13Hj5NTMjVEboo=;
 b=Pyqcgbo++qOcEMsc2AqRFKZRy8mbM4wk+UJh84lwLvV0BOXx3hmDDJQbI7heDfJWlN
 ZDgx3cSv0s22d/aAmjoYGF0ZNkWWAIljso1fpU2kAHj3bfEWfA7hH67kyEag3j7KDltr
 LAGW/0FTrS4trMXGfRUk2o+vTZpgw8LiPS3yI4z7DKLnC+yKptCczDRSjh3+oGzlG0Pe
 lvjWeWKpkx+GB+xMbGTswnKRTM1wujz6Y08lJqb2rQQ/Ipwo/3sD3CQ7evLtMJBcvbB/
 tc3DBtY35vosiHT/FoZ+U0f1Zm/nB/7shnmBycwEYuFnlsdpqaW31BIx0M4k3gKML0Z9
 7Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A5OO1vXNMuogp5FzRqCMwDv1MFLEw13Hj5NTMjVEboo=;
 b=MJABdaYfbncfrEo4VLar550iatvAJ3JVIDOQ4ljY78dQEJgvZr/1MddRdxAxPsKAXY
 PX0IfRjjQI1Q/9g400FdVoqg+HO7HaXLrxJYIKaQLOdf1wYoxyP6jfuuzyEldaM2EGjR
 Bly0Srl6wKfQmWpep9la8ni0/tzgT5UAvhyC3knz2Ob4jeJhx3FauC8hOupQociLGjg4
 B6vGvwEeTNzD+9doske+a2k0Ec0LldVl+tzBLyiBXHeWBxelXD665DryHnLjV5QfDSe1
 kGLWi/SV5aIROf4Lcn0xycHYO2shDRl/9yddgcICLfyXeb/imN+4pnuOsrouYyz0dTEO
 s1RQ==
X-Gm-Message-State: AFqh2koe8ueFcFWHxTanzdxD8FoKt2R1u+eKqWp6QMzPuEk09QllBj+Q
 PRsFgRUAsPepK2LwZRHx3v/TKA==
X-Google-Smtp-Source: AMrXdXs45m9oAj8817Rp0dU4ASHvwKG2QDpOUBnK9orIJUBMDotXFa/sVcaJfjsWE5S/LLwMAqtDiw==
X-Received: by 2002:a17:906:ecb9:b0:874:9ac1:40e with SMTP id
 qh25-20020a170906ecb900b008749ac1040emr36694894ejb.19.1674759674894; 
 Thu, 26 Jan 2023 11:01:14 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Jan 2023 21:00:58 +0200
Message-Id: <167475959092.3954305.17650572108076539649.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116103055.780767-1-dmitry.baryshkov@linaro.org>
References: <20230116103055.780767-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: sc7180: add missing WB2 clock
 control
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 16 Jan 2023 12:30:55 +0200, Dmitry Baryshkov wrote:
> Add missing DPU_CLK_CTRL_WB2 to sc7180_mdp clocks array.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: sc7180: add missing WB2 clock control
      https://gitlab.freedesktop.org/lumag/msm/-/commit/255f056181ac

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
