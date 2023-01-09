Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197406635A3
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 00:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2659D10E520;
	Mon,  9 Jan 2023 23:44:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA86210E522
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:12 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bu8so15610750lfb.4
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t/mDgzPnUXxALwSc77P9Iyw1b4SZpp1LqX9N2wGlWLw=;
 b=CYaufEjN+FQO8Ij0Vpc2EDA67qNJ5J4okXNCkY+RWe41dxiaS7/Vs7dZurAKEbLHPH
 jiy5IQqVZ6nENLhobd8CsNo+CJQ76i4qyoOGGrTW3ExgwvCFE7/kbnILtY1zWQUteCy9
 ma+m5CTTawzykxmuDbDIGlpyBBh8YJFwQEFJmNfaz80iGxh48ApazuVni6MzYh+v8ohu
 vw57vgPKJCTClhjDMfne707H9OB4iQy9vcIV8EZ1e1bQngDw+5hkGoXBxhogpz2o6sOT
 ICC62oQvWFEJzpXcrNFQRtB4yLV5rR+bspK6zHPw1ST72Bj8Qv99Z0pUiSpv3v+Ml3Dj
 eJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t/mDgzPnUXxALwSc77P9Iyw1b4SZpp1LqX9N2wGlWLw=;
 b=YGD+k1woAgEcSvhEp4itf536Fmd1jm2cY8guO3ABFtIkLqIddqXgAqlrerr0TIJyXi
 hIPkwUpv8G8tosLzP+lOg7z9c9xq6uLZmiOlwchXeDijnX81CkuAv8oGPSuT65chte5x
 1QHz2j5HJ3sDuI4D3o68Lkpygquc9g8Fy6sTrDFPgRnYv8ogLq1CK9vQUh4Uh6Ed3pMO
 taY2bYdBxatKSvd9Oo7TwzZYckYVF15iJoxJbvblKxU8uV/DyvXuRCuIgfLn+VmXf0Wx
 SdPAzAuRrenC+sXsk+p82aiOBfd53XbQZfQBLK9leye7OwyxE0RZAMFJOFTqAFih6/kA
 dPAg==
X-Gm-Message-State: AFqh2koKKFqMle96KjN/UM4v//cNBarVALngKQ58kXASs7gHocYUlLe6
 Qy11ksbjpMd+zhjqqjJJibixmg==
X-Google-Smtp-Source: AMrXdXuFEjJWeYruo91f+vSduDBZf3rVjH8VWxe3VFEYuc3GkvajLlaBvU0owcPnRbMCo6wP6qXaVQ==
X-Received: by 2002:a05:6512:2591:b0:4b5:5bc1:678c with SMTP id
 bf17-20020a056512259100b004b55bc1678cmr18912454lfb.21.1673307851241; 
 Mon, 09 Jan 2023 15:44:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Kalyan Thota <quic_kalyant@quicinc.com>
Date: Tue, 10 Jan 2023 01:43:56 +0200
Message-Id: <167330408778.609993.9217470869804308069.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
References: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v4 0/3] add color management support for the
 crtc
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 21 Nov 2022 01:08:12 -0800, Kalyan Thota wrote:
> Add color management support for the crtc provided there are
> enough dspps that can be allocated from the catalog
> 
> Kalyan Thota (3):
>   drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
>   drm/msm/disp/dpu1: add helper to know if display is builtin
>   drm/msm/disp/dpu1: add color management support for the crtc
> 
> [...]

Applied, thanks!

[1/3] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a4d6f8253645
[2/3] drm/msm/disp/dpu1: add helper to know if display is builtin
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4cb6b1eebb92
[3/3] drm/msm/disp/dpu1: add color management support for the crtc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c48c475bd75a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
