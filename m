Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAA76CCD55
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 00:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE4310E499;
	Tue, 28 Mar 2023 22:38:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931DC10E0BC
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:05 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a21so6997148ljq.10
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WtFbj44YPSQR/4fSgUx5IndQxVE/oG1HTaVeharokM4=;
 b=D0zPtyHkNeoJ9RqKP32Oa+YqC5WmMueAOAc4YAhJOMoxzbWyFjeNQmAlnlTMNYOaM+
 QWmtYwYrj6NIkNHIQT0FojJo7bjonvqDOYUujM+67t9y0QwXhsWISlY3BVLiXgTBzvUC
 v9G4fqliEJurzIFqkQJLmN8jA03v5QvW8+Y7CjOUWFZ7weQPTlWpYRoShXQ42r/q2mNq
 InLjLLAvUs36JR/CKbwLSL4vPp+R0TJVKTtuvcWYOcHGBk1EO8YlG6gAZIwlyLVJhs3k
 rMlBy4Wj8Tv8cOuGiWgZLl+6HLtn7zOREh6JV2a6Mu38+ELZsSnGiGK81mNxOlK6DW8C
 D/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WtFbj44YPSQR/4fSgUx5IndQxVE/oG1HTaVeharokM4=;
 b=pX5IRG5zxy9LNY4hs6GKEAi98bnca36I1+rJhlq9DLmzcOXAvlCqaohhuZoGHToCQP
 1aj47otOHc9zWtaIXtyj8ndi6Vk0465Qywtv3lg4DgGDIPIycBrCy92rdSq0rLssKmjH
 Un9Kg9ZY+BZwSsj+VmJyE8MpoYI9LsiwTqUUSvLIIm6gyw3OWUxm/Djr3/EXF5fxECh3
 JPEyabYFhAOo5MDGWFL9ksa71H/hKxG3uv9WC7awIZlBsf6X8aA42RQbRjbArc4Yjmo6
 VzhlyImz9OUnnrVThw2RriKy02DthVhDG9cGNKhH7uXt1d7Ympq0wkzlBtCYbdxYR8pE
 +FNg==
X-Gm-Message-State: AAQBX9ekrbh52eHvtll0Xu2xx/81tVNlormoN9Bb5Nm+wJojiumux417
 LRNSWsT4Z6YwVThA0vp9WhYL9A==
X-Google-Smtp-Source: AKy350ZR+mT4CfQ2Ri1gunD53Flr5HdyR228sB0xZCr0s2ILhY5VdzrYf4HYOKAfKXHACX/9j1SYRg==
X-Received: by 2002:a2e:82d7:0:b0:298:9e64:c916 with SMTP id
 n23-20020a2e82d7000000b002989e64c916mr4837634ljh.17.1680043083914; 
 Tue, 28 Mar 2023 15:38:03 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Wed, 29 Mar 2023 01:37:47 +0300
Message-Id: <168004255468.1060915.8365675966800695901.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230126170745.v2.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid>
References: <20230126170745.v2.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/dp: Clean up handling of DP
 AUX interrupts
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Thu, 26 Jan 2023 17:09:12 -0800, Douglas Anderson wrote:
> The DP AUX interrupt handling was a bit of a mess.
> * There were two functions (one for "native" transfers and one for
>   "i2c" transfers) that were quite similar. It was hard to say how
>   many of the differences between the two functions were on purpose
>   and how many of them were just an accident of how they were coded.
> * Each function sometimes used "else if" to test for error bits and
>   sometimes didn't and again it was hard to say if this was on purpose
>   or just an accident.
> * The two functions wouldn't notice whether "unknown" bits were
>   set. For instance, there seems to be a bit "DP_INTR_PLL_UNLOCKED"
>   and if it was set there would be no indication.
> * The two functions wouldn't notice if more than one error was set.
> 
> [...]

Applied, thanks!

[1/2] drm/msm/dp: Clean up handling of DP AUX interrupts
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9dd5895a5687
[2/2] drm/msm/dp: Return IRQ_NONE for unhandled interrupts
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f185c87fa119

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
