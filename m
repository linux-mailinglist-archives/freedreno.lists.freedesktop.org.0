Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FC8B41A3E
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 11:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E56C10E679;
	Wed,  3 Sep 2025 09:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJTt2uvl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247A710E128
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 09:39:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58329TwO019572
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 09:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PnA1zrsRSyNw0gMpmXgq+WAu
 GqVrfq31mjMEHuIgNIs=; b=cJTt2uvlRhcLEXPM50l2Nn1iHr+jDECvtViTFnZf
 UGu+lRvLDRrZWQoQI9v/YU3qR0UtoofPamSPNvmZq7hrUqAPunqKTQSzrMaJzfW0
 PlQ5lMQdE9XAmVrgfXZCtqFker+/f7kGTYOBeK8kx+DJhbuL3XKYxKbWdleTdCtP
 vbYK+SyOklxkLHFpMi/OZ126Apr6olaG9MrZIJKWDaF+d0TK0Kt3G2zHZskOXHpu
 rVN2LbjTGH++paxBTKcuDOiW0TYHaXtlZfW63T7F7oRBdRZ/08t4CStSOwM4MeEq
 m0glasTpCw+2/MPZtFWellcbpHmLxakH9BUpNyMSaLfwpA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw03432-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 09:39:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b302991816so105486601cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 02:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756892386; x=1757497186;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PnA1zrsRSyNw0gMpmXgq+WAuGqVrfq31mjMEHuIgNIs=;
 b=ktJnA4TSx2G1YKKgbALvVOtCLto+p5g3qz0wBpJ8X7gqJb7PuoB9+69uQ/0eQJTqI+
 4Mma6sOucEDTt6jX9trFGFO1BNktFM+5rMGdR9TXoKwVh74kA5iiaLoDDRd1z5STalGe
 O90cLSJleZxNFxu+QK5EpajFtSMQZJRjruznROAqF9QGHLIvSKHbD8Z+swcukZEMrj1X
 2u8x95NmB3tr9S8zxyGIQTMQ92f0y9DBt9xSApU71iPGmlnzvphujOVyC7w97XE+mZRG
 AZ2j03ijLD4BQBIuTo7WLc8tNVKKwd1OVlWlVeOqztTtw+Ykweoae2GCaFXPbjBOwhHS
 o6DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8cNovABqi7GsTTmpGpzIqZ7I04XyXQlYDN8mDWZbArSaNiYQmNwHhTheqBlMRujrRB+N/Bv4q01o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTFdHc/XsvTGFfAAenNjPosSoDOh0DEGU6J/I6Gpm/85SpnDg6
 N1BVXWjXqFxRx5wgPR0VjOUTtmzrH74MA7yzBmjqJiySwlBJUagfEhyAbcOYUb80pxG5RdINHjG
 YSdZ2f2uSmXTijECcZfcohSW+NoprWZlCA3gSVcXXKL8Epf4y9+2xkJu0MbrSX4KvKNJoqr8=
X-Gm-Gg: ASbGnctMdOFcMRyL4MVVb9rc8Yu9L6Dmn3FaisBKOuu/l6VHo8HZN7iI1XHXpEoyDgK
 rqgti9LE2MBssVPPKv2ZI4yBjTl70U11Bmkt82LbIxI9tKbn8rmaHWDFQmP4Mn77NTExTdxsEeX
 biM0vgDfPqc9jRM3MoScmMaueBA3gRBjNXCvtujEhLFNLPOZCG/cOmQx7PDBjFTGXd33JxOzkkC
 ZggVb/52BOiXRUpALzLftYFESZPuqwd8zFDVnTnnOy7/qcXw12N1up1Wn1vxRNMXiQ73gsmmNGm
 DSQRELe56aCG54Qj+GGXP8APjU2vUDUvf91jNFixdEnHcNM8HcRj4azgGuGfTBg3bSKw0lX3Dgh
 aNt+Np7D4A35i3rTJ4IAxgmvFDh4uPUn1ETXSjKri9SacR+siP+Ed
X-Received: by 2002:ac8:5d87:0:b0:4a9:c2e1:89c4 with SMTP id
 d75a77b69052e-4b31da3d038mr175175311cf.47.1756892386457; 
 Wed, 03 Sep 2025 02:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8btfB/NeOOnX7chjqs01CjROAGySEXXXx2uoY7nlmZ3PqyzGxeauLl8pu/1CkaS6/4jaPqA==
X-Received: by 2002:ac8:5d87:0:b0:4a9:c2e1:89c4 with SMTP id
 d75a77b69052e-4b31da3d038mr175175011cf.47.1756892385878; 
 Wed, 03 Sep 2025 02:39:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad5027esm397058e87.149.2025.09.03.02.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 02:39:45 -0700 (PDT)
Date: Wed, 3 Sep 2025 12:39:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 12/13] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <xcq25wmw7roelcmoljypn3ozt7kqvylgibz2cloxghaeurcwvs@jjay7hton6md>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
 <20250819-v6-16-rc2-quad-pipe-upstream-v15-12-2c7a85089db8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-12-2c7a85089db8@linaro.org>
X-Proofpoint-GUID: eFd5IcNVIwYklP36MZL3QvJ1QxyOLLrz
X-Proofpoint-ORIG-GUID: eFd5IcNVIwYklP36MZL3QvJ1QxyOLLrz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX9mCTjemGKo+k
 ca1HybbyDavq7USUxzxf9fhb7y3ssUa8rLl10hH8tRzBTAr7iKMwQfKDdwsK/R+x0CwgCiI/iBJ
 /p5AzU1Hpgbh0hSflf5jkwbyZ9sF1Gu5uZRl+UwGtQ6ndYIib8eOOjGrs5t6cwxpHzKg4LBZa3x
 xuDSgtjQym13MPFj9B5ITm3gmtQjF/EDexnoCy9wfUJ0OrL/3HZOF4IYP34hNUuVhq7eogq63ef
 P+bYiXQEVFW14TXNH42bofJGquo8DNMUfTOmWmIh2HGe/vRpRY3mx9phdC25mCMpMGYRJGpA3ld
 Tn3Eb1fUWStQbY3JtfDtiN075enpr+2tLHl8b5GtcTPLaTrBRm1UVFgQc9MA+HPswjte6N9Mhtm
 I5zZOSKY
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b80ce3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8
 a=n0UrGh5Us5r51zfKeZkA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

On Tue, Aug 19, 2025 at 09:31:06AM +0800, Jun Nie wrote:
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair in quad-pipe case, thus a LM pair should not blend any content
> that cross the half of screen in this case. Clip plane into pipes per
> left and right half screen ROI if topology is quad pipe case.
> 
> The clipped rectangle on every half of screen is futher handled by two
> pipes if its width exceeds a limit for a single pipe.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I've run several CI workloads. This is the first commit which breaks IGT
tests. See https://gitlab.freedesktop.org/drm/msm/-/pipelines/1503075

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---------
>  3 files changed, 110 insertions(+), 40 deletions(-)

-- 
With best wishes
Dmitry
