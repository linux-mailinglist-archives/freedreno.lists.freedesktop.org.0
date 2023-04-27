Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EC86F08D2
	for <lists+freedreno@lfdr.de>; Thu, 27 Apr 2023 17:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B83810E00D;
	Thu, 27 Apr 2023 15:56:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2F510E00D
 for <freedreno@lists.freedesktop.org>; Thu, 27 Apr 2023 15:56:38 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94f32588c13so1302196266b.2
 for <freedreno@lists.freedesktop.org>; Thu, 27 Apr 2023 08:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610996; x=1685202996;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JggDLFBdIl/jSBDaH5DGvn2IeczOwVOprHaUhA+GdDk=;
 b=Jk3yvWCveAWhfNWMrAWwMn2KuWl/3qOYaI5epU7anJ79rrobA77wVhOiAXloDugYhc
 vXrro+lbFXyjZPW++3+wTYpjCf3AT5QBX/hDCmRGqoMmODoth+o3RZTTXk6NlFNn2fU3
 vn49NJnrWNIbgMp0I4KgqHh5HYYU3ZEipB+bBFAPa7Z7DMTksLlzOwLesPnOC77gqIob
 1BJbc4g12Tvk7suRUDGS8skj5B2kreAttIJ8OCz6WCIK/VPnUdZh3ITrSgT0BLex/0Vh
 Ie7KoD11Kj4X6SD5iHPXTulRnR4uQaUvNnaPXVLsrGunq+TGuM0RBMA02cXS1p2IYRXT
 MIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610996; x=1685202996;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JggDLFBdIl/jSBDaH5DGvn2IeczOwVOprHaUhA+GdDk=;
 b=QRYAiYPYumbquI2skxBRjYlNDOsDek0fYJ1ciDIFrPkfQZEKfhGEoLZ5YpZNRTuNek
 RRW54k5iq3Xjcx4A744ORPnlShRh3PjN9MuozVqSxOp9Eub6FwXuGsg5kJwqPaPDTlLx
 FboATs5hyMxX74CRPADO2Uz/acfItDeWcbpdVDaV+xNSwtcaBYa3jOJTYnNl7ZlCzxhr
 Y5jP53SatKM0q7zvymuhqsGTYHym4tipYEqg2CeQYeousn3dt5t/BI4Eu5S8XmvwGxth
 UMwnQQI4PAwdAKUo6UU5+aNxD+lzUfdRbIavE4DVcdKOX9SRUiaZabmiu/wryOntKTCa
 G7Iw==
X-Gm-Message-State: AC+VfDyJ1E2HRHRPjqPiYluIRajza2/7EzyE+DwSJkwIXUqju3cTbFJy
 DQmo1/KzIhcZ6K7bcSiBqtNN8Q==
X-Google-Smtp-Source: ACHHUZ4zMr62XOd0+V2I4HhOTLEq7wM6Up0uaIzneJyRKQ0+6VT+qdeHI8kthuaft10zFLjq3+dcUA==
X-Received: by 2002:a17:906:dc93:b0:94f:1ac0:850b with SMTP id
 cs19-20020a170906dc9300b0094f1ac0850bmr2523049ejc.71.1682610996504; 
 Thu, 27 Apr 2023 08:56:36 -0700 (PDT)
Received: from [172.23.2.5] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a1709062c0600b0094ef2003581sm9828030ejh.153.2023.04.27.08.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 08:56:36 -0700 (PDT)
Message-ID: <3e0b8680-4722-7e5a-a75b-acba1940aa1a@linaro.org>
Date: Thu, 27 Apr 2023 18:56:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230426192246.5517-1-quic_abhinavk@quicinc.com>
 <20230426192246.5517-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230426192246.5517-2-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/4] drm/msm/dpu: remove DPU_DSPP_IGC
 handling in dspp flush
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
Cc: quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 marijn.suijten@somainline.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 26/04/2023 22:22, Abhinav Kumar wrote:
> Inverse gamma correction blocks (IGC) are not used today so lets
> remove the usage of DPU_DSPP_IGC in the dspp flush to make it easier
> to remove IGC from the catalog.
> 
> We can add this back when IGC is properly supported in DPU with
> one of the standard DRM properties.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

