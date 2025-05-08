Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87060AAFAE8
	for <lists+freedreno@lfdr.de>; Thu,  8 May 2025 15:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6538810E1F6;
	Thu,  8 May 2025 13:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZbZC116";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285B010E1CC
 for <freedreno@lists.freedesktop.org>; Thu,  8 May 2025 13:10:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Cin9X014355
 for <freedreno@lists.freedesktop.org>; Thu, 8 May 2025 13:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=w/O4EtEjKK+qxbkmtbfvbyAd
 Ep6/N7mvPIzRsQHghBE=; b=FZbZC116dEhg/lCpeG0WMcIP6bTCI1H1YrNIJ19s
 uFrkXgxtEeo/HjdKpWVycc7EuAyNoyML70FQLGC/kjpRpIIthFxRuASfJmIphsqd
 1PXzzmv24l5s505c6AL5teBZm3xJS5Zmk6XgdOAiHojt6VPskIG8i7E8ZVTjU5VH
 P0AxxDhV4D5b0gdbDDP40FWoJEEVGlwDfxYyDzpPthuKVOIKL4kalgQEgkN8Qaxm
 IUn6tbgybzb2bpl7gfK8vrFbElTSAmAxDbywD/Q1boLS5Vhg3vcNc6u/HRs1S6HQ
 vrLxa5pbwYaNSR/xoHN2427k+iTryH0hsKona/Ts8UiYsw==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4hdrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 May 2025 13:10:08 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3da76423b9cso11849665ab.0
 for <freedreno@lists.freedesktop.org>; Thu, 08 May 2025 06:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746709808; x=1747314608;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/O4EtEjKK+qxbkmtbfvbyAdEp6/N7mvPIzRsQHghBE=;
 b=FtGOfiXfyf6oQfMSMlcDx+2Bv/8Jg6UI+AtTF021mQBS7AZGGtYiEFRX3eKjdX9iN1
 2JJltCP5qZ5KJkCjVFDm8qI7TVLY1rEfvhKqc17Qn3+xkwcGk/grLyITJNIeAl+O1my+
 7JQJJyM1ay8L6aJjuGosxnijkl34uMqaxWvJOE7PDsmxbgeXvnMuqMhf2yNtrQ1rfHzR
 Jfg6WW4Dwtn1g6uxH93PGeIGeix4JzHMTsTPRjczB92cb5cTzRlddXJsjAaKGYnb9H4q
 pymn1gvaOM3e7ZqTlW0z4a9p5fl5ZY+LKVz7XpfMyTp8AbH4iw0aXqMdl7ovNjc3omYw
 KoLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIODDkKPuuFYya9Ukbpu6eSpIN6fcgLX53ZTb2+gHsag7MOcaXkDI/icGm/hwjPjEdYG2sRohM4NY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZhFYAECtajxzhwcL2qbgNtf7AyhK/6IxsplLp5pVXVaXuuYpT
 vo2MrI4nfQ5SNgCPZ5JaEl85MTkLUQJxn1Bg6rFh7kWf2cGsgAgoJ5RUToQROpSq3A+HxFNv36Y
 NIdYzF19Q2/SiQXqX/y2jgl+9P2Qzur9qn43q7xWLEasHeAe+T77tNuGt6zP/C/tYo1g=
X-Gm-Gg: ASbGnculapcVZcJFf8JTNwspbdckpm48gr8u33SNRLAni0/HPbHg/r01Bwy/SbX5H6x
 4LnxkTlSIicEHkORVlE6tUMeL87L6iBJwAzEGMR4j+cMC3HE7tE6O2+JSQA8wyWg9sW9h8xkGcf
 NNBo/RMmdtNIgg/yzlKqTUoO/H40xy/gOGKmCnWeNqc4OZbsPXUyaywo1hrJ1yExFhKDWdDSn0/
 fiZ2oeZowj+4i8hfGQLUXIrbX7ybDPAQBceJNw5ikRxxNQx5oc5Vp2WeCuHqgWa9KYao7Mz2vho
 lGuOq/00UD1jq1uM3lEA97m9AGlnTkDhHeiCtV4jL8bOysFLJINd6znvqyvKhOU99QcKoWZB8I8
 =
X-Received: by 2002:a05:6e02:194e:b0:3d9:39ae:b23c with SMTP id
 e9e14a558f8ab-3da73930025mr87333575ab.20.1746709808045; 
 Thu, 08 May 2025 06:10:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB314junkzcSWTlXKpliaMGOOcVxB2b9W3HBxoMLJhqRFuk3kZ19/VfaMA3FAuObQqYvaDaw==
X-Received: by 2002:a05:6e02:194e:b0:3d9:39ae:b23c with SMTP id
 e9e14a558f8ab-3da73930025mr87333165ab.20.1746709807695; 
 Thu, 08 May 2025 06:10:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c2d937b1sm71441fa.55.2025.05.08.06.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 06:10:05 -0700 (PDT)
Date: Thu, 8 May 2025 16:10:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 10/14] drm/msm/dpu: Use dedicated WB number definition
Message-ID: <b4e6kiaxlsth6ix6gxlfgfzracx6sogv6fnm6yu42rbvrbprp4@ih2cgxtyuwpd>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-10-f7b273a8cc80@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-quad-pipe-upstream-v9-10-f7b273a8cc80@linaro.org>
X-Proofpoint-GUID: fdDI6APZ3zTIWodi61503BrXB0BMTiF7
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681cad31 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bMUmxHA0tSjQgQxMAzsA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=8vIIu0IPYQVSORyX1RVL:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMCBTYWx0ZWRfX0bTIkUmnFf+l
 NXh6ucgTsgohgcN43BhoNFJ/Uhu/TTcbkLYdRwixQWZ0C9FnaiA2nl1HNYj4UP9bYuUFCRvmgA/
 Zd/3qCiLYOzuwiOtDADB868JJFXX3GmGnbaKmN1ULVW2Reit+PLnhVRvoWB1Bd5om0i77sWVMLu
 w96XRwJePG4SRKOeiWcGuhlT5BJ75T85a8D5wp7aXtV31F3tCEIqq3jzrP3xRr/vE0ON0BbMoYV
 Sg1tPPWvHBL/N6UOR7/sm0g4dgxg0d8pbHWpKeM0Km8PiOzYa5tk831PCxN7SJvmxcPsQ6VJakF
 acd/wRfgFW/4TTTLrXBecZ7GRQb7NcAqfk9FYpiZUg/NtRfJrRs1qcU5bpVEvJnMwhzVzptXrMT
 kH6ibIBxdEMK5emU7eC+4E0GkkhQUhXlcmDT6AX8CwT6LqqmyuxY5JE1cx4Khilctbfek+HE
X-Proofpoint-ORIG-GUID: fdDI6APZ3zTIWodi61503BrXB0BMTiF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=760
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080110
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, May 06, 2025 at 11:47:40PM +0800, Jun Nie wrote:
> Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
> supported at most in one encoder. The case of 4 channels per encoder is
> to be added. To avoid breaking current WB usage case, use dedicated WB
> definition before 4 WB usage case is supported in future.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
