Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0336CCD5A
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 00:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD86D10E9EB;
	Tue, 28 Mar 2023 22:38:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2603D10E496
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:08 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id e11so14160390lji.8
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZTRJ0TTqpgk5AjNv95VOIk7xe/ymEV+pZnyuKfYsGM=;
 b=MeyWE82b5nRejN5xQ6xs/nTf4qV/VYG55PfiMgUVuECOnfrCeGEAFUAdAfV7a3QVWS
 F0oR+OhDiAoLm2+K2dI/DEXjvwQ1s8LXB6+6RK8cIq4iRN32sY/GyCnve8TTBKjgQuEc
 Kg4bdvcZje4GD0Cg/jjCR8WTPdU/hJrE5TBK/u6zVMrefCe+x/aZTojiP0sc6XhSiu2X
 Iz1w21O5qJkrRNU5fjGBRn8903bqEruNkSm8TxTgugVHYuw1Q3kBSSz9GH7SHiXYvf+P
 bPJs+IY75bLsmrhlPu2nj8whMLi7mk/qDRAe2UEg92EBynFLjmeDMoZ5EIvPTosSP5LC
 6Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NZTRJ0TTqpgk5AjNv95VOIk7xe/ymEV+pZnyuKfYsGM=;
 b=mZxs3pIZoegdSbYciSdl7lv1p7+jkaJCedO+Yo25wtrIlpmoRHKN1waoMbDMcbOWvI
 cqE3JI7KuhGAFCzaXl0J+ZVBw2oQEDzLPNzYplD/fXVfW/usfs9iAp/pPayLrBv5O+9k
 q8b3QAizlIfH0Sx/ovEiqF3Qn6zXtj9P6RYBDJo4NF4KekRvM+D6b5+BMplF6n4i37cF
 fffY3+0tgisk7nRsDWCva8CtzV3rg2at2YueMZp0moxkityrRo1K/XApTd353vdtQNa+
 us3Z7Di5hwipeGasjtZoB/6m5PAtM6+UBLhcR7e5JM9VjFA8xTukzAeaVy0tNUlX6oRc
 inMQ==
X-Gm-Message-State: AAQBX9eaasJBBt7qZ6cSt+/JN3OqFcDab8SWSl+KbmHz9cv4J5BN7mMo
 rbO+drIP+VhmyihKP6Q49teIfw==
X-Google-Smtp-Source: AKy350ZZ6ELOP4cO/h4cwM1q/AaisZK8fOKm7ULEBLxVANiD4pFWjDs6CEtRSDHRPCZDhKNGppC+8g==
X-Received: by 2002:a2e:3813:0:b0:299:9de5:2f08 with SMTP id
 f19-20020a2e3813000000b002999de52f08mr5119053lja.6.1680043086182; 
 Tue, 28 Mar 2023 15:38:06 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Date: Wed, 29 Mar 2023 01:37:50 +0300
Message-Id: <168004255463.1060915.9592020077874857953.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306090633.65918-1-geert+renesas@glider.be>
References: <20230306090633.65918-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Fix bit-shifting UB in
 DPU_HW_VER() macro
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 06 Mar 2023 10:06:33 +0100, Geert Uytterhoeven wrote:
> With gcc-5 and CONFIG_UBSAN_SHIFT=y:
> 
>     drivers/gpu/drm/msm/msm_mdss.c: In function 'msm_mdss_enable':
>     drivers/gpu/drm/msm/msm_mdss.c:296:2: error: case label does not reduce to an integer constant
>       case DPU_HW_VER_800:
>       ^
>     drivers/gpu/drm/msm/msm_mdss.c:299:2: error: case label does not reduce to an integer constant
>       case DPU_HW_VER_810:
>       ^
>     drivers/gpu/drm/msm/msm_mdss.c:300:2: error: case label does not reduce to an integer constant
>       case DPU_HW_VER_900:
>       ^
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Fix bit-shifting UB in DPU_HW_VER() macro
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c8f370bde5b9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
