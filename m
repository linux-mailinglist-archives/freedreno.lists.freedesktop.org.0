Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FFB6765A1
	for <lists+freedreno@lfdr.de>; Sat, 21 Jan 2023 11:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F363610E075;
	Sat, 21 Jan 2023 10:18:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174BB10E075
 for <freedreno@lists.freedesktop.org>; Sat, 21 Jan 2023 10:18:33 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id f34so11413688lfv.10
 for <freedreno@lists.freedesktop.org>; Sat, 21 Jan 2023 02:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IhxX7/UwQW8UUFDvL4khisA5BoVLy2kIVZOLa5OOWmE=;
 b=HK9CZn8vUaj7wtN5p9d9u0jinRiwaXYcycnv4zmdIHhP4TnYD6w/r0u+5nU5KWfOEY
 4CMDMtzw8EplixxbfzL6PhMDf5BwXkrIshoiR+rzqVZonp8K0+TL/Bb45gTwuwLB+kee
 1vslT+Ypxlj1ADlVGj/0S8m8FJckfkAX+bM/N4rBQSXvekae9U8BmkB9vD0OGibO22Mt
 8wLXAVIL4IuwY/5GytRONAVL8snYmrhozsFaEMuLhUJyXRHmhjVSETAg3P9FIBJE2Cor
 4k21VQIz4gf12fB4Cvtdjs/e/vN+c70bmNm8PwF4//NUa09djhraiXKl6YYBr1qQvPzr
 5FfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IhxX7/UwQW8UUFDvL4khisA5BoVLy2kIVZOLa5OOWmE=;
 b=ftrQSJhXkYko3qCkiZlrsqn1XC9dh1pYLqu/sH/cUrq2q4uS5ZMAfnrJHuhtaKW2Ix
 1d7tvsanyhrUZVtChV88e4IEgxAaE4RyWqF188uKDhMGBHchCDK56ldaFeZs19Z5gg4F
 lpLnNGERFOxPbuWFsVf6WOjNGbfReoqh7TfiL5vdQMzhV7uCxlyLdG5ey7L/8jXGvKVb
 /ZjmXWK8zF/rPSN+KAIVulyl829wXlHfJ8vnhmxR0nnNJ+VyTrzPHLJNMXjveIv/a1YD
 vcs28HkEGZoTvBZo+G/8t7PBPwGiW8+0iAMR2EKevarkHtTwmoN+qSEatLbPwZV6Wygo
 ugNg==
X-Gm-Message-State: AFqh2kpfsOezLCcXZH3tpGwRzLz+jRiY99PpXd6cKoXsVlWGJOUHIlaW
 HFWU05ScOHbpWom1BfAtpTc0/A==
X-Google-Smtp-Source: AMrXdXvz8nBNsz7o5ZBwtfuhMuDRBOhphFcv9Rf4dn9bTjdoTg1m0a2W8lMTp68UgR66SJIZFxdWSw==
X-Received: by 2002:a19:a418:0:b0:4cc:6f42:a086 with SMTP id
 q24-20020a19a418000000b004cc6f42a086mr4512527lfc.64.1674296311281; 
 Sat, 21 Jan 2023 02:18:31 -0800 (PST)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u10-20020a05651220ca00b004cb10c151fasm6252975lfr.88.2023.01.21.02.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 02:18:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 21 Jan 2023 12:18:30 +0200
Message-Id: <167429629506.2742089.6139689256773382900.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/8] drm/msm/dsi: Allow 2 CTRLs on v2.5.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Fri, 20 Jan 2023 22:00:53 +0100, Konrad Dybcio wrote:
> v2.5.0 support was originally added for SC7280, but this hw is also
> present on SM8350, which has one more DSI host. Bump up the dsi count
> and fill in the register of the secondary host to allow it to probe.
> 
> This should not have any adverse effects on SC7280, as the secondary
> CTRL will only be touched if it's defined, anyway.
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dsi: Allow 2 CTRLs on v2.5.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1fe5158e7894

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
