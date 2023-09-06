Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD228794578
	for <lists+freedreno@lfdr.de>; Wed,  6 Sep 2023 23:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC7010E72A;
	Wed,  6 Sep 2023 21:54:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1929310E72C
 for <freedreno@lists.freedesktop.org>; Wed,  6 Sep 2023 21:54:54 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-500913779f5so428178e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 06 Sep 2023 14:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694037292; x=1694642092;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=DkYl7VpiqGBLcvquobAdpQle0l6YAv8HW9CuQ0g8z3E=;
 b=kNPA0PRGG6Jk3aNuvgVX4Y+2onGnW7Tka69uYa6Tviv5BoeinUDGePWl/h5vfBVdi5
 N71Gs4mzppdkqh0oBcZjvF1Zr+i176bdHiMtAhA7fkdi0MyzSTdCJCc8/6Ni0injqBiT
 n+aJeK5+6Vd50Qf4RNib6VdblLS83QnJqrgx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694037292; x=1694642092;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DkYl7VpiqGBLcvquobAdpQle0l6YAv8HW9CuQ0g8z3E=;
 b=KCp4yRQc3Gq8yIY5cbBvTkNnuLnzs+bICIhScnecuwWn4ru80tHAsvj+GpCpqjfmO7
 xkPYXCU9/PK/mc67LCQZ8+A1L4l83dNGx33+PMZ8T9Y1XwGEJT6o7WKZ7Q70aTg3468b
 rJoZarf95y4Vd8Nw7Y3dhh1m6HFHmht6c2Rkaa5mRh3QhKA196MKz3U10CfiaYTQczWa
 BjacyzqQjkH3J4xBcXDuXEiRntNaP4+NuQ9jdsGyjnTxrSF/YDzzlVn+gppgNdBm358s
 CkuBRCoRe1iFWm+aQrBuUNz9Ao6HlcTEAuEbck1zNC/dk2KrzlS7G0YqcBIV6r398vPz
 IB9A==
X-Gm-Message-State: AOJu0YzELVHhFZTvm8t/0n68dEI7FMldh7pK68vjxfk+NPRZTm1+Y7fN
 LpAp8iEXCjEHsEfOk56JgpqE3EXHOm+73uio6xMw1A==
X-Google-Smtp-Source: AGHT+IFaSO4E/UjLX8wEpGO6s8aIiIGvV3rajeXxbn36XQd+d1XBBlsCEK0E9MFFtjh00AsmBN5wr+6S5yv+y1DrN4U=
X-Received: by 2002:a19:5e17:0:b0:500:d4d9:25b5 with SMTP id
 s23-20020a195e17000000b00500d4d925b5mr3321799lfb.56.1694037292435; Wed, 06
 Sep 2023 14:54:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 16:54:52 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-4-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 16:54:52 -0500
Message-ID: <CAE-0n51Wrh8J2eH3uEnOW2e78TW=BGpS+UGtEdfjOqnHjXGjHg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 3/8] drm/msm/dpu: drop the
 DPU_PINGPONG_TE flag
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 19:04:49)
> The DPU_PINGPONG_TE flag became unused, we can drop it now.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
