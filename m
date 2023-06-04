Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2318F721446
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 05:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82C610E19F;
	Sun,  4 Jun 2023 03:01:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBC810E18E
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:48 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f3bb61f860so4595782e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847707; x=1688439707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vqZu2+86qpa6J8c7UM7f5JxWOqtwBHGUvC7S2Jahgg=;
 b=wE1Eof7zF8xvSTaAmXBiCImMSapv9vqPAUp/CxkJoJ5W8/eIDT2+EDFP6oB9Ej6TZz
 NBWHFEKTZdh2Vy9XiQyED5G6qwqPWIlXIauRN1MRjdLfAzu6Fsa+thLDspwcx+UNHQhm
 +nypntpxt3rC9qU8CtOVgLs2+WhjrBPwfikdpRCFWJ/azuQkPgeSeyu78ywZogpdiDCQ
 p3Y7O+qtuwwX0Z1OiVzdBaJd9kmvg3maXiqpLX/FYRvR6dOYJ7NBzyAhgatxzgWQEj2Y
 e4CE70kNkGDR3FqieS2IpetyjxLR9bf40IaNs2oCCYNLHk57yXnvv73bA9+ao2oO70ce
 xEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847707; x=1688439707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vqZu2+86qpa6J8c7UM7f5JxWOqtwBHGUvC7S2Jahgg=;
 b=a2kCIa0tEcuhDxiTx9XH+aO6RUD4HjXOFYCXH11NoiPSjojfeuXlm/rVA/HGmRNPb8
 oMoiKutTplQsTCeZKLzYdkeHPX0d8JMMCa04Fyqhma1FVDnSzjmLXVJPPcu/FRwGm9eg
 5+7kkc82mEcIR+H3Cv9z6R1IneEDiEyQi/ZXELkH8G1A8QGWcnrZHKtY+bk7g4gqGfGH
 KUuoHD0CrWefTh+BoPKGuFKQFDPFYJqFEPfR7q7JNXw+d7oVtmP+bE6LPk2gEaYlZXVg
 7SsWN9+WJbqNn5TM3y6SfHWn9FcTdGUlW9wVz4zormC23OiX7kQziv9D6T0bpcuoIRER
 0Mzg==
X-Gm-Message-State: AC+VfDx2ZNmb0UdNluvS8CxdUxj8MyiHIFCYzXWLcmvH/H5+T7k34nUQ
 bzwvGQFE8XX8FHmvUylESZCoEDEQAl/FT7NlIPg=
X-Google-Smtp-Source: ACHHUZ5QqEPp8PdFbvNEcYJYgWNC3qc6Y4rgEoQ9eHDJtqkpog+9yv6rCX+GH0t1E7CVkNOHqnJI5Q==
X-Received: by 2002:ac2:491e:0:b0:4eb:1527:e2a7 with SMTP id
 n30-20020ac2491e000000b004eb1527e2a7mr3228957lfi.45.1685847706977; 
 Sat, 03 Jun 2023 20:01:46 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Sun,  4 Jun 2023 06:01:35 +0300
Message-Id: <168584750426.890410.4013288321469753930.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515030256.300104-1-quic_bjorande@quicinc.com>
References: <20230515030256.300104-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dp: Drop now unused dp_hpd
 module
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sun, 14 May 2023 20:02:54 -0700, Bjorn Andersson wrote:
> The dp_hpd module is a remnant from the downstream design and is now
> completely unused. Drop it and all references to it.
> 
> 

Applied, thanks!

[2/3] drm/msm/dp: Clean up logs dp_power module
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9f93258549db
[3/3] drm/msm/dp: Clean up pdev/dev duplication in dp_power
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9edac2eec47c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
