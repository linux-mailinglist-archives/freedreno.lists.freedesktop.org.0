Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0D6697235
	for <lists+freedreno@lfdr.de>; Wed, 15 Feb 2023 00:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9810F10E9DD;
	Tue, 14 Feb 2023 23:57:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69AA10E9DD;
 Tue, 14 Feb 2023 23:57:57 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id v6so1997016ilc.10;
 Tue, 14 Feb 2023 15:57:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yeYxkETlP+j2/3REjtjMCDSYf/OdbSqdZdWMS3XrVDE=;
 b=lMKQ9ToPsw/2TcYca8QatWnIRmcuk+lzeyC66xAj73i2rMPdzV20pgqNHoBrjro5d7
 dg0Zg9Bu/RxMLGdcgIszHXquVcjDXeg28uq8+QdgDmju6ncKaYY9pdy7arReXQBKo4Ta
 lguE0QYN61xjqTIhQ4dCaaXep7a5cc0JmOyHFLQE6lawQsfuksyX6Lnb65jA8SyD45ZC
 3Nrkosw7WICJgUT+kKYFu1lKYhAqrGDzpX8JLWTqwkjxXARKUZDHacYUsEgmZS9A4oSK
 eg8MY4Ab1CeTv9xUC8WsfP9KlH88E3Fh+Gg4Uokj8bFIn+brDfY3SEXbzABWthVnWqEp
 2MDg==
X-Gm-Message-State: AO0yUKVqNJJuae6yoM+/ilov851+0Le24q+LwphL8a9sQf0m4NyqcHQo
 873xaiRUh38m6fCOD8FEaw==
X-Google-Smtp-Source: AK7set+VE+S5NKrV/pyFHml4rxisTMgU4caFP+H7RsaZYsZaoraA1KXIngG7aiNE0DTeJ3y5OVe1BA==
X-Received: by 2002:a92:cd8e:0:b0:315:415a:4e61 with SMTP id
 r14-20020a92cd8e000000b00315415a4e61mr526178ilb.11.1676419077169; 
 Tue, 14 Feb 2023 15:57:57 -0800 (PST)
Received: from robh_at_kernel.org ([65.158.198.6])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a92c603000000b003129e9480ebsm5107354ilm.47.2023.02.14.15.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 15:57:56 -0800 (PST)
Received: (nullmailer pid 56787 invoked by uid 1000);
 Tue, 14 Feb 2023 23:57:54 -0000
Date: Tue, 14 Feb 2023 17:57:54 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <167641907419.56714.15225525581461170662.robh@kernel.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-3-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230211122656.1479141-3-konrad.dybcio@linaro.org>
Subject: Re: [Freedreno] [PATCH 02/10] dt-bindings: display/msm:
 dsi-controller-main: Add SM6375
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 agross@kernel.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sat, 11 Feb 2023 13:26:48 +0100, Konrad Dybcio wrote:
> Add the DSI host found on SM6375.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

