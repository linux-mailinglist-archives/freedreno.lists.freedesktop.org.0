Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A2B42D96
	for <lists+freedreno@lfdr.de>; Thu,  4 Sep 2025 01:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6B410E2B9;
	Wed,  3 Sep 2025 23:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xx0yNjCW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A265710E2B4
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 23:46:03 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwwI0029138
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 23:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YkAb+BdBtP58KIf9+ez4rCZs
 0vp9S2izMGPKnDHcn8s=; b=Xx0yNjCWc23/jxyl1eg4ByuqjbHai1cBJFdKW3Q5
 KvdNa7vyj3JWHPxkffq/lRpP7fXMPDknOw6cGXnM/+uk9KGlm8r89byL/v9JMlUO
 QJoLrscT7vDB+w02w0XPUZ79Q9hnk7dw1AXzTZkW34JR85y6bk8kPQMLVv9MbOUP
 pxOFxEUeZYgV6bPNI+dUzwEzod8JbekD7jK/WiPbKj/3MSSy+oJqWZhmdoahRzxY
 vDMStYZ2i2Ckf5Ghux+rqoiqbg6kPdyGa/bdQ4MQgCUqh4mQ63XZXhqVmXktDw+4
 6X0kTnxdAalkzZHB0sN+ObWTIiDOqBESgoBEf845xGPr5Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw05jf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 23:46:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-728f554de59so2555426d6.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 16:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756943162; x=1757547962;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YkAb+BdBtP58KIf9+ez4rCZs0vp9S2izMGPKnDHcn8s=;
 b=KoqLedf1y3gs5Ftm9qV3g9PPciddz19GHLSKLfeaeg+Bq4KrZhjAKblFJHlWOXnErS
 eSzTzWT450E7Af7lf5KcxVisf7iYLMZJJ3b//0dQN0/fGdeK8RZp+sJB/C0Qe9L0udPc
 zNNoIXSYyGJh2yZJdjK2z84Ft7hElN/SaKN3ZLfVsbVTk4BpxwitbvOJ1JA8T6YFE8dB
 iSZLvPyIT65RJGOUkVuBL90QBOAKVaTe5UBvdmxcri1+eHNq8k8xIcIm/wF2LwOfpw9b
 koOFlD9csCivrdxE4tYjdhHVOG3Z35eazwOcLsNca48l0UC0WemKAEPmfB8mLFUGrlWm
 9spQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa8iYmAmWtNqzb5JG7IZfzg5uqidez+2s77Whgu69R0oaO2eer9iel1bh3dZcebcQy+PbT7xTlRng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxISRh6zU13r2zfXcc8DNmHeCJ3PYXAJ3ocDhBqRw8nYggtlrUc
 cHsgswyaGmdnYZCk4geyGr+Vva0L5aEYDIqV+8Yx5jUy+wKoa92pLAhAzJpYIbXq8zNQBKQtJad
 eo1eeJstChJ7u080qzOy6fLeNcBOz/9KS3/r92tSLyxwaJWs9givoHUGdp8d7WYmN/9lNegU=
X-Gm-Gg: ASbGnctUcbusGjOBabGI3xvylJaprfPbDsAN9y5KMNUVgH2HK3RohcyZMZdVd2z8fv0
 W+JXsigjVty99k7UHoVTSACThpXM6O+rWT5gUsxuJGgGmt6mdFlRr0p2o1+AycXp91FBeWWmlSC
 WUylRZ2zCd7N7RcIBJLQCk/Ds0/mTG4JD01n5HGYIM2RIpuorbUdktx8bkiivqNrZA5zG4yR/8V
 q/SQKEVhGLlYsCZ2zib47IhI7RICnuk1WtJl56cIuAB/8W/f+bbjXDTEjw9BIqsDZkXkq3tNBuP
 EeIbRuABrGvBqExtR4ERMLFHg9BoFV6hLcv259h3ijctBStnsj3uDuA0d1/aIDx98z11qAgp2eM
 irpTHxZ+UFA4fSZP0XVsI72K5UCD10v9iECdozfhuq1P64eRIUO/s
X-Received: by 2002:a05:6214:5199:b0:718:a53c:d5ea with SMTP id
 6a1803df08f44-718a53cd8b4mr134396606d6.41.1756943161737; 
 Wed, 03 Sep 2025 16:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeKw8/l+JU/+w+pUW5gWTeEM0B3lNbyMq4ZaRy2csjRNAmkpAtPFYULmhJ/idZ8VM17Hpkeg==
X-Received: by 2002:a05:6214:5199:b0:718:a53c:d5ea with SMTP id
 6a1803df08f44-718a53cd8b4mr134396226d6.41.1756943161076; 
 Wed, 03 Sep 2025 16:46:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfbb87sm827119e87.105.2025.09.03.16.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 16:46:00 -0700 (PDT)
Date: Thu, 4 Sep 2025 02:45:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/6] dt-bindings: display/msm: dp-controller:
 document QCS8300 compatible
Message-ID: <j7whxaqfeyz6fqwg54h2mivobbvo3plvxxzor7whmwjkhavndw@ulqfidkwwn6j>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
 <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
X-Proofpoint-GUID: SK8N8Gk7EjEnOnKRgribO_peM-sfsXdb
X-Proofpoint-ORIG-GUID: SK8N8Gk7EjEnOnKRgribO_peM-sfsXdb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX+HAgze/5RoOs
 TNmVA/tJFZanpXkUgnLXHuw92OutlzOtNgGl1urtLvMDpyzdNaem3ViVCaDEFGrsjTdAHOkjqU5
 zc81pgz7q6aU9AGe2/qEz1ONcT2U/YON7PPsMVtA/mt7imruexXEILuZy9zvbJTJF4ypSMX5ph1
 ibBoUgj8DOcFriIBqIOtyRuNquCB/q0eiyIsOWoz44yqv94paZX7JCnWwUm2S13bOuLKuYEhUjF
 V8Ct2OLo/w+BfNedrBFCUh9f04rVfmAL3tv05C3GuyZfL1zkXi21a14siYQGY+o9WlG6xytfe2n
 4Yx7cWRkwmmRxwS405ft05r5XmEcayt8yOSM6tkC3DPCACU1EVOLmLGpyyKvJh13A+hvpxcHixe
 JFtFN2Rh
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b8d33a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EZgLUtVhDPKl7mjbVu8A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_11,2025-08-28_01,2025-03-28_01
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

On Mon, Sep 01, 2025 at 05:57:30PM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.
> 
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> that supports 4 MST streams.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml           | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

I've picked up the last version of the DP MST patchset. Could you please
rebase this patchset on top of it, hopefully making it finally
mergeable.


-- 
With best wishes
Dmitry
