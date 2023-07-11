Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1B574F1CF
	for <lists+freedreno@lfdr.de>; Tue, 11 Jul 2023 16:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C26F10E091;
	Tue, 11 Jul 2023 14:22:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA30D10E096
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 14:21:59 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b6a084a34cso88281601fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085318; x=1691677318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3W+xlIL+92+mtc++eFiUk2X+gdyaS8tS745CS5vqzOs=;
 b=pSWajOYHz+yJb3wDqA1JfnJsu5NUfy2QnvR0mrgsbuDq4vNQVKZ8GG9nkVwb/1Vyb3
 G55ePchLyqxCoW/5qgX9PFOqT8CZDZOY4MxGBkjT9ZbMQqejNdUDOMmNuSzjIxBC6E9n
 e6Ws4FAukID5i+oQ9TuVm2mCbXrvfWQjKfqPZ5UAnkv2RrF22zL0VMt6nwEPMyj+gF7F
 yOtOLxWt27Ch5W1OWIznR3G4NVj8KZuPEdpxwzBUXit2zI3fomzLulGy82QLOQBv8ztB
 cmoJ/6UB6Y+7F5nvklhM4MJEsjRejIywSc3WvbEDQDX6sP/LZNc/mbm782Z15DQ78q2M
 46rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085318; x=1691677318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3W+xlIL+92+mtc++eFiUk2X+gdyaS8tS745CS5vqzOs=;
 b=DjMW7Cvuh7wFpsB6lgi3wu7umxWaS1pHgxb9prvFFLc9w7i+Ha2aQl4JMPbzb9yg5T
 ckuyskkAmhUvTzr0gopQbMSHlUrD4hQROPhhV0nyHnux7431SqXEuIDD+/+n6jj1OQ9h
 T+RDbUXlbS3Ac90Kh/4cw+xiNktW7sErWYrX1pxtD+IJ31uq+GiCM0zBytLf9ex7HSxi
 WlUGVhk+qtwt52LyQMjhOb2wRf6UWn/H45PNopwbEdrKg3Xr2B6qf6GFbfJwV/7nHd3y
 NwfkVouMbrV/YiAwnWPzvz6uBYIrX/BZxcN/e5iw3Jf/5L25FSlG+P6NDv9YZki45fD4
 73UA==
X-Gm-Message-State: ABy/qLawIxUXwlK63CRnZvQGqm/Gnban+StOtwWqruoZ0jc9d2/NoNwy
 Esr+ZLLD7o7GsxhEG5Ro1vkU7A==
X-Google-Smtp-Source: APBJJlG3UheJ5PjWmq8p+u1ZohyLsO6cGtjSYMuPOe2sR7renrjFhF1N9uvXWi64yWQa6e+5+vztGg==
X-Received: by 2002:a2e:9b15:0:b0:2b1:a89a:5f2b with SMTP id
 u21-20020a2e9b15000000b002b1a89a5f2bmr13320689lji.2.1689085318180; 
 Tue, 11 Jul 2023 07:21:58 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:21:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 11 Jul 2023 17:21:47 +0300
Message-Id: <168908465046.1869384.9699263240973946904.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 0/2] DPU1 GC1.8 wiring-up
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Thu, 20 Apr 2023 03:14:53 +0200, Konrad Dybcio wrote:
> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
> dspp sub-block in addition to PCCv4. The other block differ a bit
> more, but none of them are supported upstream.
> 
> This series adds configures the GCv1.8 on all the relevant SoCs.
> 
> 
> [...]

Applied, thanks!

[1/2] drm/msm/dpu1: Rename sm8150_dspp_blk to sdm845_dspp_blk
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9891b3df2b43

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
