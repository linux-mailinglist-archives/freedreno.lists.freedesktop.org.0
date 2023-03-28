Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3FC6CCD8E
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 00:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E38410EA18;
	Tue, 28 Mar 2023 22:38:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BE810EA09
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:13 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id z42so14148908ljq.13
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6FuPPDUcJgL64Qc5i5ibOoN0goVd5i3l12v70KzNl8U=;
 b=er9het2Lu4y4h8jUA4KPhi0YDGkuCCcp2GmD3MdT8HVcWJTIVxdr7UlIdTACH61Ms+
 RSxESLG9/b9PLw/pzOpPELFxkyTFv2MzXlNCFuU0Z3QM7wmM4pSZpwUc4LoUYClTZgB9
 wB2f+ZS/BwHX/Owhm5Jkt7v6PB0BuU964yZjXkhbBhUbtbohKnFJaflwj/9ZzqbSrlLS
 aiTu9RYLMGBx6iNJqkjGIzWK5hFxDwPREmNyrFwr3mOFikjB85JJa4k6ycsqvV2LqDCl
 FbblMCeUOAgBChGbVT22EmRBQjWX/6E+/K+yNv/ts/clcsAb+phi6pALbxjSoROljg9l
 wTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6FuPPDUcJgL64Qc5i5ibOoN0goVd5i3l12v70KzNl8U=;
 b=7h3Qe/5+GH+cENMpWhU46bJyBg4iDRqq70XAHmZ3Bl+Xxv6FXpUOWCe8W1Npa2k8/b
 hboYKs4vAxP6HKfMRSFWRcjAuOMrW119Hbdpdafqp5yM97RjEHeeSXmPjGtHHIOsHTZA
 MkASDjCqxnOjH4G238YN9rUSQAulWJFsiYfdYXWpPQQVgKzJcCmYQYGKId7HEAk6tqpk
 cbaPaBwYNHvhQZwK1B57MTyvUrk1xMIh1Raxf4We3mjE1bFJTFts0Z5m1ObWURW49K6b
 tXbkuJTmq2yofWgsnyBo2UZh9fpZLuGee90Gts5f6tr5c22G0gLQwnEGdkxkoMgYk2ln
 G3Uw==
X-Gm-Message-State: AAQBX9fRNj6/4TN1ax2zAZr0g1s05IGWEDdLdtximM3tSp/J1nAzIRbq
 ckRUMwaYgXIm720Igsg5o7EbXSJeMPehaS20V+Y=
X-Google-Smtp-Source: AKy350bPbKumo1VlMVHKf/kmOLkRz2OCf8CsDeedL/ZbAs0BUINpS0/8mtGotRdWh1mAdIyWrEZadw==
X-Received: by 2002:a2e:780e:0:b0:299:a55a:f66f with SMTP id
 t14-20020a2e780e000000b00299a55af66fmr5572861ljc.22.1680043093150; 
 Tue, 28 Mar 2023 15:38:13 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 29 Mar 2023 01:37:59 +0300
Message-Id: <168004255457.1060915.6291843271360187892.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230213194819.608-1-quic_jesszhan@quicinc.com>
References: <20230213194819.608-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [RFC PATCH v3 0/4] Move TE setup to
 prepare_for_kickoff()
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, marijn.suijten@somainline.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 13 Feb 2023 11:48:15 -0800, Jessica Zhang wrote:
> Move TE setup to prepare_for_kickoff() and remove empty prepare_commit()
> functions in both MDP4 and DPU drivers.
> 
> Changes in V2:
> - Added changes to remove empty prepare_commit() functions
> 
> Changes in V3:
> - Reordered "drm/msm/dpu: Move TE setup to prepare_for_kickoff()" for
>   clarity
> - Fixed spelling mistakes and wording issues
> - Picked up "Reviewed-by" tags for patches [2/4] and [4/4]
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dd7904e0f824
[2/4] drm/msm: Check for NULL before calling prepare_commit()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63c3df12d13a
[3/4] drm/msm/dpu: Remove empty prepare_commit() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f4d83f101233
[4/4] drm/msm/mdp4: Remove empty prepare_commit() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/191604898585

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
