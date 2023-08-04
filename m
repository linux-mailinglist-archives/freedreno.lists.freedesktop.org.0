Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 192527704D8
	for <lists+freedreno@lfdr.de>; Fri,  4 Aug 2023 17:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D80A10E72E;
	Fri,  4 Aug 2023 15:33:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AF010E725
 for <freedreno@lists.freedesktop.org>; Fri,  4 Aug 2023 15:33:24 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe10f0f4d1so3911355e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 04 Aug 2023 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691163203; x=1691768003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f6jlXHLj1MUCfLZToewZeR7OtzKxIt9mLVk/gVOh5yw=;
 b=mdnuEsB4ff942lzJOdWVE5DqJm3m702v928B2Mi3mmyo6TIqs665k2iz+eFXpRSDsO
 wxNH7lZZnvlhOUiY1/Ingp+O0ZRLgna3JH04B4vy7QvFlJ9xWJnXnXp5n10x50OXGYMx
 +bzzTM6bUFkZETdlNeqJ3eBuD9p3S4KiCptEMJAo2PrnroTF40rl66GGmzv8h49zg+YQ
 FdEmOdD9PuxiqQ9JcKC6DM2q9d330hRd3Q4Y3qPLOBeI1zJ0OHIIvCrvrLCmXSBcpufJ
 ROJ2c0wA/i0WFKBqWxvJLA3i7LJ2at4dZO0TjY4+Wwx3w+PnHlCEDLr4B8THefjCDIGW
 3hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691163203; x=1691768003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f6jlXHLj1MUCfLZToewZeR7OtzKxIt9mLVk/gVOh5yw=;
 b=MHkx8aAuVULL0mtVnbwaPclufNQQ8fUxsUVhtyEB63aA59ofOIj+oeQbDeiy+kKiGp
 wcuK+r40BHKU+n97LiXkk32FfHjzZ5qIrhyogOahqS1AYRKEZ1n3Mr+k/Eq5LiSKhmIe
 A963EOSZUQrTcdLMHCh8GQYWDLbrogK1oWPrw1W8c8Q04LsOOgxD3lUU58BK23rEUxaB
 PKqStAGOeyurLe3eFz5E3HU7r5MCBDMSG2u40EggFheMRf/5V2mPvD2vj9zb82ITBlH0
 N3tRYTJYUDzo1Vr3ReTKifZMIplFCVJZ+FNmgUVQLEgAgBKV24S1uC7b86neXVqUQMa6
 sC7g==
X-Gm-Message-State: AOJu0YytverflYRF14DNweWZXK2uQ7pS0M+6Q0tRNmYDSrex3IR2PkWc
 CAgWvu0PsbCZcqrM5DY8Y3RpTg==
X-Google-Smtp-Source: AGHT+IGW7itXMzBpTRGOomYFU6pVFSKbCE5PJfR8t9U8RbjMcV1bPdCvMMMUsQWTLeJSl+72NkQFwg==
X-Received: by 2002:a05:6512:3d0d:b0:4fd:f876:d86 with SMTP id
 d13-20020a0565123d0d00b004fdf8760d86mr2138504lfv.50.1691163202824; 
 Fri, 04 Aug 2023 08:33:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05651204cc00b004f873ca4139sm411874lfq.71.2023.08.04.08.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 08:33:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri,  4 Aug 2023 18:33:17 +0300
Message-Id: <169116308154.148471.9274793163444236457.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v5 0/8] drm/msm/dpu: change interrupts code
 to make 0 be the no IRQ
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


On Wed, 02 Aug 2023 13:04:18 +0300, Dmitry Baryshkov wrote:
> Having an explicit init of interrupt fields to -1 for not existing IRQs
> makes it easier to forget and/or miss such initialisation, resulting in
> a wrong interrupt definition.
> 
> Instead shift all IRQ indices to turn '0' to be the non-existing IRQ.
> 
> Dependencies: [1]
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: fix the irq index in dpu_encoder_phys_wb_wait_for_commit_done
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d93cf453f51d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
