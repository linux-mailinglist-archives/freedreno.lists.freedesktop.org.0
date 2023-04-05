Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC16D720A
	for <lists+freedreno@lfdr.de>; Wed,  5 Apr 2023 03:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073AB10E818;
	Wed,  5 Apr 2023 01:35:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B2910E316
 for <freedreno@lists.freedesktop.org>; Wed,  5 Apr 2023 01:35:55 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id h25so44672096lfv.6
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 18:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680658554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8T9R5i94+/2OP7HuMgTF5yTKZUTemdPeFjSlLzm2Dnc=;
 b=OMVgcTpZuLq/PQ6/k+aK7OTpnn2/ZCCIPjXPYW4jUDBS6Kd7Q4o3Wt3vJyeLtVHf1N
 fmUQktdmtlNXzvBK1w18RVF7qfGaxnXP7uqbVbTUdl0xVQQtPz78KxOk3omTHHuB/Re0
 gLO/62Du6Ygoe1ATL3SISWtR1HnbMXndXXdr7DyhzqaPgBu6NCJGPMZ0tN/TWQ/IxCAJ
 VqSiXMj3B/hwEf0KPBiYKmavvkl630yaT+IeF5h+aw6Pukhcsj+gq0xXG0kD4+HjINs9
 7/MvAIAKQUO5MIsg8xNxuCp1RGkKchbSfpiXnnfHO7MJkc9lH3+O00SotGDJ6f0A7iYx
 li/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680658554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8T9R5i94+/2OP7HuMgTF5yTKZUTemdPeFjSlLzm2Dnc=;
 b=3YksV25Cbu3/OALxOU6v7g4XjBz/kK3azO8OZiAdc2LIZU7uOfIpcSd8yQ5Z7f0R0x
 xdi3rAen+oy8GLMoL76i2F3azaT0OCPeEaVKLWld4cJPK57LFvEuWGs0JEsYVnu3Ad5l
 r+rFdyCLM/XkAo0kdWv0BfPk6bYpL2NxwiklVCY4Zs4d2Kua8rQkk51GyFTJmiZCWRfp
 6o7K1NQwcyo6FJavzJTkgof4dXJ7obd7tvqgWltMSOZ2BTFx5oif9E5xP3YiiSnY6qJP
 WDT2q/4PCiMBCVAHiKsKKwQ5adCLrGn/LVtG1AtSAoh4GHxKlNuWgqmvEuIdI+QKKD99
 Y/rw==
X-Gm-Message-State: AAQBX9ctIMvNpm2mFUj6Bx4NZO5fuS2RqatQTRS7VObiLAih2sXKP+V0
 OGF9stTrjMmydsNGOpUHCUZolQ==
X-Google-Smtp-Source: AKy350Y8UL4Py4l6LUj2E+z7XnI2ced98i5LZcteJw4LmJjqnvp3RMX0MgrzzzrsqG9YpIl6luPNVw==
X-Received: by 2002:ac2:4108:0:b0:4b9:a91c:b0c9 with SMTP id
 b8-20020ac24108000000b004b9a91cb0c9mr1099637lfi.7.1680658553930; 
 Tue, 04 Apr 2023 18:35:53 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v26-20020ac2561a000000b004cb8de497ffsm2572326lfd.154.2023.04.04.18.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 18:35:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, vladimir.lypak@gmail.com,
 Tom Rix <trix@redhat.com>
Date: Wed,  5 Apr 2023 04:35:50 +0300
Message-Id: <168065850331.1260361.13413836522831140170.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404185329.1925964-1-trix@redhat.com>
References: <20230404185329.1925964-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp5: set varaiable msm8x76_config
 storage-class-specifier to static
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


On Tue, 04 Apr 2023 14:53:29 -0400, Tom Rix wrote:
> smatch reports
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:658:26: warning: symbol
>   'msm8x76_config' was not declared. Should it be static?
> 
> This variable is only used in one file so should be static.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/mdp5: set varaiable msm8x76_config storage-class-specifier to static
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d2f762745162

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
