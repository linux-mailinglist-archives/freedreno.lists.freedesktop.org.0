Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64642B37195
	for <lists+freedreno@lfdr.de>; Tue, 26 Aug 2025 19:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341B910E6AF;
	Tue, 26 Aug 2025 17:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfKd+GfV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1936E10E6B1
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 17:45:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QB5D4H021591
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 17:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Fo1/9Ip6/4Cnz50sym4R0+zd
 sohgsrtps0QIg0lGkcM=; b=SfKd+GfVGy8xCvuGCGOvIj5jNVwjV4HE7/RKfpyy
 V0BQCWKndvp1G/yRrXqPDmnB+T7L2ulJyIajRk7Yubf3pD8RLLLFuMschKiNMo9X
 +oUkU9fPk2y+oOxhzbJoiXdadeS0kuOppSq51pT/IcJHDJwVapwSwJlTGDMdWwGU
 Wdho7eX2MfubXdAJHcYcSQILGGnoDtpvEU1SE4n8+RV33oOaAgmstJGRNRoZGeOg
 X9UyB+7pbha40sDq2IwR0kSg/qwP1oDvHeJXROmhvMrck+aAUL78RVbCAmNQ2HR1
 U2FlXdz0WGfpw00kVOLjhSPT4gzbAIXaauzZh0dAeAmxCA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2t03u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 17:44:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70dd6d25992so15653236d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 10:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756230298; x=1756835098;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fo1/9Ip6/4Cnz50sym4R0+zdsohgsrtps0QIg0lGkcM=;
 b=nT8/pgST4BPYaX9zcagUVeqYwRTzztBLUpOdzgSELirY7hIiXCVDgv3BapL7VuhEdm
 gEgiLW1gACeycPW0Z4XeYhpjI95HRod1gRTh++gtGXKW4monKaQ9nTE5oKIZ7hozD6T3
 6+CuZX4BI8FSTW/90trqobNGBCKmoTjI4FqZZVQdYfl9cdsX2Fsn8zOvgDozu/3fO0W6
 3hJDSIl9tNukku6Be1b06oDGVWUY3MjpLQtKO26gRqi1tu75lI2PIwSP+j4spOpUe1bp
 s7GTbA6oi3FEgFggrQ1WHJIoEHNCIym5PKuUd4SDXbLo4NBHx8yFnKWCadLb7nQK1bp+
 H1ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgVzU5QPq/f+irKIUiCfdxKljy2RaRzgmf6UgxiH00V+ov+Vpa6UNEj6epIh+4+aSS8LuDP3fpNEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtFo1r7F+qT1IkX9PrEylxdpVTsA/mCfFExInOmRcQwkUxqJPM
 G3zGxJ00LTZocrPnOLleJPTWd4mM9f1urFwsv1sXnxDsEqckAgjjn7impPyTyvep7z3lmVjyfJq
 aDD315GLisSdcX9qSF9ErbRMXJVTiXth1pNuHbuuaXppmoBhXz1NEvA8XNzWw1QYyqMjDbo4=
X-Gm-Gg: ASbGncty++mmaeJUzTaVWOahsy31yLV1LwiXK7/PwpfshxCagQ356NhN7xWfBNPdpBw
 iS8nOXmnw0GE5P43sZCWv9H0DRsZ18YIJF/lRgpUhMC2BdEE4JBlyfp2KW5r6kpZyA4kE3dFP3x
 tZVPq/69968HUMo8hOw38WRQHsCCYdf5AGFWZsMP4EANB+VuJ5IFhS/8AL2+qVpegIuZJGe1xdo
 U9ZqSLh9QWyLbWXJNC0eRK8BYCv7rNcY8TZGPjStf1MDOz9FqDLD0F2L3qVqVcXKm/4i17dPPuc
 y4DKGog6S0i9fW+URooYexUf6qrDEa3ov3LcS4vhASLWgmXeoSSv/fkNonALnKkqeyFPKXmhHnc
 ilR9aQvEfG8cVpC0umo8/VitwDWlHOfxo+g8lhP40cDQ+ldMLCZ+6
X-Received: by 2002:a05:6214:5283:b0:70d:ae3c:b712 with SMTP id
 6a1803df08f44-70dae3cba60mr119353656d6.26.1756230298144; 
 Tue, 26 Aug 2025 10:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqr7erg1723NCR76J53tDrWLPj6Q4rsJqNLBT87HEUC8VXg2JCngL3ZutGor5JaNkJQe0UUw==
X-Received: by 2002:a05:6214:5283:b0:70d:ae3c:b712 with SMTP id
 6a1803df08f44-70dae3cba60mr119353156d6.26.1756230297529; 
 Tue, 26 Aug 2025 10:44:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f3f260c7asm1945645e87.126.2025.08.26.10.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 10:44:56 -0700 (PDT)
Date: Tue, 26 Aug 2025 20:44:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 29/38] drm/msm/dp: add MST atomic check to
 msm_atomic_check()
Message-ID: <lp7yv6w2ofbohmhfusroetk6dy4hbcegdfuuzo2bywmngccefd@q5ssvwe545g6>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-29-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-29-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68adf29b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=AVsrb5vlp7rL4eKdMZ8A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX6v2FgZpN1R9S
 gBs/gjGP03wBMPhAjtWzKFrHdgOvQNhQQ1yeWFnUdEevqe0alYxNNZ/UuTxo5fCR1eh2QSHGCmQ
 /nnzX81qYirOhB/mFIpzfBknxhMsqq9H+5nqtW7brcaCKIooJ1TVqHGabmPni5c9O9BLHnHbTNK
 yW44VEDE8daEnWDi2SMZSBxjaJOOv5+O9JrOdzuIwwtKfq8EMYV90t3w6KYkdJ3wEOdv7mpN9vv
 kimvKW350F9Pcr4LV2sZYJns5xW5fQC2tODKhpcSnOzbAwcWE4bdeoJu/WdtD3Gfr7BRJW9OI6g
 hAnss1/jpCbaXtngn7XG8f928ebY9TJ1gw8QX/CILdGjq3gX5ORfYMsvPqHq4sy8u5N4ORjDUVa
 j8+VdMUu
X-Proofpoint-GUID: CbwZeLiwtgzQFoqAogv0IcrztKbIQGIH
X-Proofpoint-ORIG-GUID: CbwZeLiwtgzQFoqAogv0IcrztKbIQGIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:16:15PM +0800, Yongxing Mou wrote:
> Add a call to drm_dp_mst_atomic_check() within msm_atomic_check() to ensure
> proper validation of atomic state changes related to DisplayPort
> Multi-Stream Transport (MST).
> 
> This complements the existing drm_atomic_helper_check() and allows the MST
> framework to perform its own consistency checks during atomic updates,
> such as validating connector states and topology changes.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
