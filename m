Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B4B6710BE
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4FA10E647;
	Wed, 18 Jan 2023 02:06:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19B710E63F
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:39 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qx13so21451770ejb.13
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IfmhJrvRWfUC5D3CUUdjzAYNIM2kHYmHQdiJOf/ROU=;
 b=w+hu4Qm0z16ldHxczDe00Y41K5vtZ5PXlGgBghOUz39DYC3gQXuhYTQMJtrhxq4Ymh
 v5Iu6CtQOcG3rwF+TgXUS0WlRQYlVUIt74WRrxFJa9823+suIoEXfCtsRAfW2+SMYQuu
 9FX+G5SdU+w/i2o9m64FKiirxOs1wH+bBRrp1JBsGaez3cfNdcLDB3pWIm+EKpFKUpBa
 4vV7ODiSSU/nl1AykN8/j9cSHczY25RjC5WOlnqjJ879l9vn94uWxpnjOVLdjiTft2Op
 iw3j+L9MLlVpGfRUHUPEdtkwk6wY5ho84aAK2smpCp5psKsftaESNXY8DBeooNovG96t
 Kx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9IfmhJrvRWfUC5D3CUUdjzAYNIM2kHYmHQdiJOf/ROU=;
 b=d7gxAHkPimR7CCAzXmHbe7nHREdVjlBS8K+LNs9S1vIbWWvZS1y686KlvPlbsrsZkV
 0UQ2qxkz6i78zqnDkP4nC5GR6knZ2iJfN0k7J06JcaBD5E30NmT9adXscPwo20FMuena
 7WWsyEso7rfww3fsxORxYYl/JbxLM9HPPhKrrYdniJz2KhUXJnrCFxKTFDUjUgzrvA1f
 YMg1eUXr9wX17eR7GcTvY6TMQjfg6la0YV0HvaxpMFL48GD0PK7faXGS5z8BG8FkSCz4
 WIYzZjRSQVP8Cp4DNBYw0w7SdHa2B8Az9S2RLukSmVsBTRKBiQzrJXVER5+8TGomCuRG
 voFw==
X-Gm-Message-State: AFqh2krQnWPtNgFQgNpciF4q/gAFOeBAzf4fX7+rLzbL6ruhXalSq1v7
 Q36xMJuJXnKzlqztx/wXCJqZSQ==
X-Google-Smtp-Source: AMrXdXt2C1AYGJI145oWUugmSjbdf9sJ5mLy1O8PkJlJX/SIy9mMUJKSJDO7UiobV+oiMqKQ2wLIcA==
X-Received: by 2002:a17:906:eb0e:b0:871:be7:c984 with SMTP id
 mb14-20020a170906eb0e00b008710be7c984mr5085808ejb.34.1674007599352; 
 Tue, 17 Jan 2023 18:06:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: phone-devel@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed, 18 Jan 2023 04:06:19 +0200
Message-Id: <167400670542.1683873.15043456378376951686.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109231556.344977-1-marijn.suijten@somainline.org>
References: <20230109231556.344977-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dpu: Disallow unallocated
 resources to be returned
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
Cc: Vinod Koul <vkoul@kernel.org>, Jami Kettunen <jami.kettunen@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 10 Jan 2023 00:15:55 +0100, Marijn Suijten wrote:
> In the event that the topology requests resources that have not been
> created by the system (because they are typically not represented in
> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> blocks, until their allocation/assignment is being sanity-checked in
> "drm/msm/dpu: Reject topologies for which no DSC blocks are available")
> remain NULL but will still be returned out of
> dpu_rm_get_assigned_resources, where the caller expects to get an array
> containing num_blks valid pointers (but instead gets these NULLs).
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Disallow unallocated resources to be returned
      https://gitlab.freedesktop.org/lumag/msm/-/commit/abc40122d9a6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
