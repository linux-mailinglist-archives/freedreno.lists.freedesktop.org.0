Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74756710A9
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454F010E641;
	Wed, 18 Jan 2023 02:06:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194DB10E62F
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:37 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id mp20so33231207ejc.7
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xl/XkiU1Zo5yPQtQsNq0TJFZYt+lSpYW+rHMFbbmx2c=;
 b=gVJWAsBEx3ro0T0bUaoK50N5rPdtAA/91kHfTv4oMfIYEgKKo5KTQLXDtTRK6Fp6lD
 KvrOP4GyZgoo9ALHmAoh6jE5jlk08eQG4fAaBYRdkRJtBKWpHxB1aMGDarndtSU2U9Fs
 YXj90ZtY6EL2ILLAq0wq02cG80CoXopsaBbq2QvQckBZmFKPvf5oyETqlxLBhbbQ+vNf
 jyjiNAyUf0u9ehQwA28QkSxtNqwHABoADFwkoD6pEsDbVW0dCZBJ5Dn/QHyXepVk8PJS
 lAN9a4VgcU86knE1xVjWrWuTy4qOllkxHVdnzPD5yk0NzclaGk2OBZI0kWbNjX43HxVI
 dRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xl/XkiU1Zo5yPQtQsNq0TJFZYt+lSpYW+rHMFbbmx2c=;
 b=K5TEsKH1guf3HRjXhUQs6vTuhatyWSjhmrtcXrurEZaGyWRdM8Cx37/R45SmbzAY8J
 poJRrIlmiVdTniMzWcQ4b0j8ddbTy3fAXfC7BswjiE47wUeMzH3sP+O3rtsxxsQqbz+t
 ZbgiaKprONTm1hzGZn8hTxAGI2q1MfGfYns5tYZxYcs5UoqjlLlDExWADAw+TqYSPpJG
 p2Mk/51GOoEM27IMMwHcYb/2WniktKWt7vjTg9zsKuRvU9oBbbZwJw0YEraI1eIDJHDf
 lnOD4RadFydKlk43Jik5M74mguVxw5LUZHv1YxTjR5NqrkOxhIM+Vt8UPrLntMmDw8If
 +Vcg==
X-Gm-Message-State: AFqh2kqsJOlvrBepFKuJ4kfAN2lA7cf/wPbwBN20sndZHK037Mp2sbbU
 m1KoSjGs5g9dZtYJwXHTkv0nhQ==
X-Google-Smtp-Source: AMrXdXu70jLkMqpEH3OC0+L22Q20BtYClmQohFyXhQMcYw6a+N73826h2xTZraxRVcY7q4a0I5/sgQ==
X-Received: by 2002:a17:907:c99c:b0:7c0:d6ba:c934 with SMTP id
 uj28-20020a170907c99c00b007c0d6bac934mr1098233ejc.13.1674007596720; 
 Tue, 17 Jan 2023 18:06:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 18 Jan 2023 04:06:17 +0200
Message-Id: <167400670546.1683873.1758703609286578116.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221212093315.11390-1-konrad.dybcio@linaro.org>
References: <20221212093315.11390-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/3] dt-bindings: display/msm: Add SM8150
 MDSS & DPU
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 12 Dec 2022 10:33:12 +0100, Konrad Dybcio wrote:
> Add bindings for the display hardware on SM8150.
> 
> 

Applied, thanks!

[1/3] dt-bindings: display/msm: Add SM8150 MDSS & DPU
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9ffbefc1553c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
