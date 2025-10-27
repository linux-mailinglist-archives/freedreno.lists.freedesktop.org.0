Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FA0C0DEE1
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 14:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5A310E48B;
	Mon, 27 Oct 2025 13:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjh+2Rii";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB9610E48B
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:14:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R8sVP81090823
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nFyzKi5bv7XzhZEu4Cpk+WRY
 5dnAaHHoSnvN/ez9mr0=; b=pjh+2RiiyRIkOe3N+YJqN3TwoEj4CEejkjcAuiqg
 eTNuHP0Os9Sz7E6MkyxZ7yPTKOTbVK6TAJMmFrSCsjvC860dongX6tGYnABRWVzS
 wVYrnEqc9vFYFjjDuuYVIAXx3SVif6ZwmvJZwqvxE86/Q+LwSCYANe3T68ptbJrP
 v9lVlF5LWEBQm6lIWoPKAyuai8LKrkTxNuw7UizS7jBGk/ZKo45otfCbUXpxU3Tx
 gUH9KaOaJxEuNcrJ1+4zX1LQ3jHNlREa7Xz7JO3+5YVL/1GoYjbUcLmhYHDcpiBZ
 Eb1JL06WICkHrog0IZHMk4odthMZx6HQNWiniq32TGyhow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1ud1t2f1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:14:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ecf8faf8bdso51498751cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 06:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761570884; x=1762175684;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFyzKi5bv7XzhZEu4Cpk+WRY5dnAaHHoSnvN/ez9mr0=;
 b=XkgJFWclBDaZ+L090zn0IsHYqZvQTCBQGzOfImJ65NXD0gq7Pezp31fJcul9rwj4oa
 N+i+sFWxLTsZF1hBkGTQRid56dTMTSP/47UMCiAo41rFmVgo30pUD9filPboexuZcB9L
 UKcsnqd3uarw0udA3Rf58CH3yzTgw1WTacw7Y5dnKDPLv9UKlDJ7f1ZPLzZ7lR5Jn17y
 e/MYeh7dkyVcGYsnaFZ/8+LyScy7ABrjKY1aaESoMLK2L5TUQDIW+7ac+iX5o0LdJoEb
 FZuCurxpM4YI2CaXf0S6cbKTXG2J2REXVbWqa83K3rx66n6/UdgKdajkW7MV23+ZHZE2
 Gk+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAWd9cw0kx/DvV2+znOzg5CHqU4iRbSVpiX9OYj5k7CgLQY9obK+UFnwHDHYbaByHKKf9qF5yPj30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmY6dEVqBA6hTCw3QUT44UqDYmASGxrmy+cHmUbQ/vc9M6E3c2
 fHU0kKiH8L/wRm7wakRcKs5j3NzGKLq3jn5GulR7zYDE6fnB+XE9htM8y+1UxL5UOSXc9bgPSWs
 zT+dCfb3jHuWg8cz74aIs0sXia8Zg3zaBj2Kk6BHa8up7T5v6wIB3OLY8IP3IszJwr3HJmKU=
X-Gm-Gg: ASbGncvz0q2ftl2iY3b13rJDCWbON8rl0BGLliWcLJOwzvjUhmQ+bpMQ3LFPZV93+WH
 bZSgKFP2cNNTABS7x/fGLmUljXmDKcEuNbo2uaz2jiYZX7wU6JqdPZS28ukPutF2hqN/SeY8pej
 QrDaE9dMxPTASZw/0nHUaByLXfXsxl9cklxXunlPR8NboSs9xD0QOAquIIFuFmPUOjTWVZFR2Kr
 HGhOXcrTfcHWQ4DeHN+ctd6nZ/kKYr4DuWSFdhuAcb+pAe1kpOlxfZUQo2sBRDHlhOKk/XemkZ8
 BpF8PZNYlqOHT+BTPxtO13hpy/hyYdnh/c1ZPdt4QEYqYz+YphLIe6mwLOKUofNQp8Xj2FGhck9
 UuFhuEqYg1wSleKykJuuoAG8JE0wEED8SjuJyNE46a1NX4wOthcCTE0Hrt/RVMrd7pgYi7oaOGN
 8ii+vvL0mM7Fw6
X-Received: by 2002:a05:622a:1b28:b0:4ec:ef85:cfbd with SMTP id
 d75a77b69052e-4ecef85d368mr61632141cf.80.1761570884063; 
 Mon, 27 Oct 2025 06:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvwWHynaMcFsCoJT3Ymx6akKgKGq+AVYZliRWBvt3fl/sJ+nyNZdGM11CdtSCxGsRp/Z4JPA==
X-Received: by 2002:a05:622a:1b28:b0:4ec:ef85:cfbd with SMTP id
 d75a77b69052e-4ecef85d368mr61631541cf.80.1761570883540; 
 Mon, 27 Oct 2025 06:14:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee0a5655sm19154971fa.21.2025.10.27.06.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:14:42 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:14:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyMyBTYWx0ZWRfXx778ocFMIdp+
 ybkUwIIm3vX8x/gvaaAidOBvck5hxz6iqCrkMxT9+E2fbZpATlFhgw+LqvXraCEc0mXE3SGQPK1
 IzEdRg0CDdU8j9qFrya0zyu3EzbRyw+1tkZDeQFIvNB/fcCZH9En5Jq16c4jc+Ot18GMmRp+6HU
 ldURVlKc2q56jJ5NHZ4WhJht3H0Frz7jVPvm+AVA3N/V9Q7wf60S7BwCwICRWb7UnEn9YPGPFRF
 +9hlB1Nd3+4oRNmwBHlYx8XD4yjgVnzm2yi75i/T4YOeYlpKH+Na2dvC4eY6Gg8pSNNRry/xqYu
 X2w+VHACvhsa3AP5cCuCjXbDkiVHNlVN9VG2LPKKeHDsptgYECFfi2Tl17WYthqlrljPjnPVq2T
 PRYZfUE9JgdmLAf8YQ1d6ox/y9LI4g==
X-Proofpoint-GUID: Nr-Jdghzduckgai8w1dIj_gIr2Fg7qM1
X-Proofpoint-ORIG-GUID: Nr-Jdghzduckgai8w1dIj_gIr2Fg7qM1
X-Authority-Analysis: v=2.4 cv=UqNu9uwB c=1 sm=1 tr=0 ts=68ff7045 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ACmnMjwJHZESoQLvWlYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270123
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

On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> > On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > > On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> > >> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>
> > >> Add DSI PHY support for the Kaanapali platform.
> > >>
> > >> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > >> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >> ---
> > 
> > [...]
> > 
> > >> +	.io_start = { 0x9ac1000, 0xae97000 },
> > > 
> > > These two addresses are very strange. Would you care to explain? Other
> > > than that there is no difference from SM8750 entry.
> > 
> > They're correct.
> > Although they correspond to DSI_0 and DSI_2..
> > 
> > Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> > new features. Please provide some more context and how that impacts
> > the hw description.
> 
> Thanks for your reminder.
> 
> Correct here:
> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> 
> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> just some register address change.

Addition of DSI2 is a meaningful change, which needs to be handled both
in the core and in the DSI / DSI PHY drivers.

> 
> Thanks,
> Yuanjie
>  
> > Konrad

-- 
With best wishes
Dmitry
