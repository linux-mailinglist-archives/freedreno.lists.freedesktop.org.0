Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C43179365B
	for <lists+freedreno@lfdr.de>; Wed,  6 Sep 2023 09:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C4910E593;
	Wed,  6 Sep 2023 07:34:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A91210E122
 for <freedreno@lists.freedesktop.org>; Wed,  6 Sep 2023 07:34:49 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31f4a286ae1so2109901f8f.3
 for <freedreno@lists.freedesktop.org>; Wed, 06 Sep 2023 00:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693985688; x=1694590488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CMSRLHXlFi+3qNI1oF/iiV7PXrA/nSM0CvaGy0w7SXc=;
 b=NaBkF33vbTET3jc7DGJBjlmhVvLrUHmkjpfoQ9Y/prsRFCQjEQaU1NULjWmT1bOimL
 rg+csFt+B/FyPycukGjsCWHSxY/L1XpLm7CdfF4LpA+XcgbVlsWK32kQbzzJGaWefzQF
 rhnS9eI8PLD2IR4uyPdxDMaoMS6VrXQMdn/BklHx6iKmQ8FtByGbAASw4ybyyrWm9Xn4
 SqH+SS/Uc4ZeDFHa5DQp4gJels1UI13Wrh82IL82CYM/X+8NzwqF28tuhrsOwmptlDJ4
 ze9GVPz5f5mkAwp687SjKdAGEoWlfPXETERDAplk8wl5NHDfky7v63J9Us9mBzkif++h
 CPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693985688; x=1694590488;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CMSRLHXlFi+3qNI1oF/iiV7PXrA/nSM0CvaGy0w7SXc=;
 b=Nybpbzjgr1NoEZ/K5AHg68AobZd3tyvRiEue1RNiT+GrYflA1/zqgDeCbNlNd1hGm8
 b6RlYPsOj5d0tVj0O3Dn75HLRndp6IJuG2ZjygN5DkQdSPrrJ+27uPPLVQup9Jlnuk88
 r2/pRaGfF9xqZmdXjg4yENwtTpPqA2Gyn0rG53aMbIG2+xb6q/Ixexf1+ynJfBPadmQx
 0dO1vmceT42UIWt0zd9JyOmJJ524bgL4xF9eikkXl6+irI1gu5fDtSOa1b7tdpMiEfbv
 LvFXIojB8iszwdEx8yO9xkrOq1lUvykwT+B57TIF1lUZGsL4DoeB8+dA+FzTdNv+Exy7
 F9kA==
X-Gm-Message-State: AOJu0YzvyyLq0SPGAo2wyxySjEzD+a0f5Lneoei8+LTjBCpMxY7Gs0Yc
 BtWdVUBeLtYu8OlmjVpnO/lYcA==
X-Google-Smtp-Source: AGHT+IE3sb3hti0p58bOyqh94e0W5av0EGUu5XQJfY0ge33yXzp+ulTksbLVlMy+IMnfpoe6+6+qqg==
X-Received: by 2002:a5d:4fc8:0:b0:31a:d8be:d6f4 with SMTP id
 h8-20020a5d4fc8000000b0031ad8bed6f4mr1329142wrw.10.1693985688339; 
 Wed, 06 Sep 2023 00:34:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adfe9d0000000b00317e77106dbsm19508192wrn.48.2023.09.06.00.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 00:34:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230831225738.26527-1-quic_jesszhan@quicinc.com>
References: <20230831225738.26527-1-quic_jesszhan@quicinc.com>
Message-Id: <169398568750.126904.4693079366206552749.b4-ty@linaro.org>
Date: Wed, 06 Sep 2023 09:34:47 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Subject: Re: [Freedreno] [PATCH] MAINTAINERS: Add Jessica as a reviewer for
 drm/panel
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
Cc: dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 sam@ravnborg.org, quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, 31 Aug 2023 15:57:36 -0700, Jessica Zhang wrote:
> As I participate more actively in the drm/panel subsystem, I would
> like to get notified about new changes in this area.
> 
> Since I have contributed and continue to contribute to drm/panel,
> add myself as a reviewer for the DRM panel drivers to help the review
> process
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] MAINTAINERS: Add Jessica as a reviewer for drm/panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6bd3d8da51ca1ec97c724016466606aec7739b9f

-- 
Neil

