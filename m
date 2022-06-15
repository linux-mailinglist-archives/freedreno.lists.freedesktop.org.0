Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 752F254CB15
	for <lists+freedreno@lfdr.de>; Wed, 15 Jun 2022 16:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228CB10FD5E;
	Wed, 15 Jun 2022 14:19:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C05C10FD5E
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 14:19:45 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id a2so19164249lfg.5
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 07:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=A9RmSO/OHnan4DfbcCHEVVY9M4r3MnYRFQBaUW6bNWA=;
 b=MNuMF3PuaRY/+6YKpSGtGwP/4IuvRcZKjZOwztV73IB8RG1NWUXPWaU2BFUwCr5ux6
 nBrrd+8xchQCtImhgEfLaO4XTIbMV5XSVMTLk6ED6SSBDT0nTF4DGaiqTC5iP57OnHyd
 UnMT+znTe8UDArIKd/v8jCrb2b01rK/7rRWt77ff2CTsrz/hjzgoF/Q79oG63L1TXG8b
 ODyf6yIpWkuPxejCxOUmlcetemEUmOZJ/PHWn0J42S4FAhLHKTsGRd/YiVUb0Kd/SYd7
 u2l+ZoFA8i/WTSrXUIWOCnXlVFg0Im6YEETIIqQZfPzvhp+69RfGTUlaHICOsYkfT2DP
 jaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=A9RmSO/OHnan4DfbcCHEVVY9M4r3MnYRFQBaUW6bNWA=;
 b=mSrC+o7JeoIj9uVEqMfv5X7PR92A0+SVgANTDHteRn5bX35zaA73VY/MbA3DRhBOP0
 ki38AwHp4FgL5qFfyzkNLtU7YvS51FK8i6tVDnfTrbizGLMAtXQMu7hM6voAsZlnePu0
 sVGXG9Rd7OpqCaZGRjBoHPo2ub9LHmv1LweN15DQGiquhf0sdvFx3Dl/Iae05Xe8Tmab
 uqx5veLm25hyXciEVxyZ1H1P7ZMRfrv7BZV+NTluaxiVPqxzqEv4SwS3RPwJ3Ftwd75O
 SsQ5HfOh2KUMacMQlrteVbEMSv37ScvPGeDYGDoPaokTocqK+FzoOfOrGWSfXCGU6e9X
 uwug==
X-Gm-Message-State: AJIora/UURK7uOODegZzDazcNpzTbNO7aJqb1Yer7PpwCfIaJMpvypjM
 f62ulmPXXtg6+RAJuLCF+I4KrA==
X-Google-Smtp-Source: AGRyM1ugCc/2OaezlkOsaaKljgQlyk2WvF+Ik7GaQdltNSp7JiRkOQRFbTxT/C1eeTM0SUyJMfAG8w==
X-Received: by 2002:ac2:58d6:0:b0:479:5b9:74a with SMTP id
 u22-20020ac258d6000000b0047905b9074amr6019118lfo.551.1655302783810; 
 Wed, 15 Jun 2022 07:19:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v5-20020ac258e5000000b0047255d210fcsm1818418lfo.43.2022.06.15.07.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 07:19:43 -0700 (PDT)
Message-ID: <5dbc0159-cb33-db5b-20cc-05f3027af15e@linaro.org>
Date: Wed, 15 Jun 2022 17:19:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Stephen Rothwell <sfr@canb.auug.org.au>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [Freedreno] Please add another drm/msm tree to the linux-next
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
Cc: Rob Clark <robdclark@gmail.com>, linux-next@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Stephen,

I would appreciate if you could add

https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag

to the linux-next tree.

This tree is a part of drm/msm maintenance structure. As a co-maintainer 
I collect and test display patches, while Rob concenctrates on GPU part 
of the driver. Later during the release cycle these patchesare pulled by 
Rob Clark directly into msm-next.

During last cycle Rob suggested adding this tree to the linux-next 
effort, so that the patches receive better integration testing during 
the Linux development cycle.

Thanks!

-- 
With best wishes
Dmitry
