Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF5EBA3F78
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 15:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320C210EA6B;
	Fri, 26 Sep 2025 13:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6lo/YR9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5CF10EA6B
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 13:53:56 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vfx2001556
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 13:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Yi4YzfqCRhtpYtMSpi4c2pxv
 l7JbhY/mvPEjH/nHU/A=; b=Q6lo/YR9Xww7cyAqG2tiisx9896ylw2lmlhsi1kw
 ohTR9fLm5V8++Jwg6DlKftwyxU8ebwyPmtw3soLo+vY4/F9ttxvcrhDtHQNxZ2zY
 nbsGvln+/gULtI4PVzp+1z1xvWszL4ArwaJhGIUSWfkhjZAvyEloNWQ0bXyvoF1F
 p1+byedn7jC34PreGn9bOlTEB7B6jNgKG1/D7nuBuhNbwUxKtz00Qp/5gplFufs5
 z8aApQK0vHd7+PtPeKCTAKwjEX4rXbLvb4Yl3sIlnJuMdLNJQPnTowtr5VoJxVEa
 bKXXNrTASPK+FmJZNFw9VXEY7nQ5LNP0umsD/SUtD6VNcw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tu1vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 13:53:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d6a41b5b66so53485221cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 06:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758894835; x=1759499635;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yi4YzfqCRhtpYtMSpi4c2pxvl7JbhY/mvPEjH/nHU/A=;
 b=cxDLywU9jJwG25qcdBv71os39sYtMxNP5ViDxk16mSvBOBo7sQ9GJdhfI31JsdfmHV
 0DqRJZSAxQabxcuylyXMGQa/NT9TW216tTYivAZc+r4a4zbZjUF6ubUF4wZvdH4Occ/8
 Dc3My9fbXDpRWYeWr61J63dk1FWnKZlakBYWLGP9YieS+s2K+BazLiVQSt0kQJhzaduF
 gvMdb2bUlEP/ooVr+x7kG2SVXmP6BdC17PXoIQA56yFjm7wsJ+1AzMEpAfLFdCJRcDCW
 HM4h29F5f+ejWa6Y7HZqqjJVZr/T9/WSSrg5fughQTuyIIjSxDkxWVOYfBCdEJPvALDx
 ivTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNFcBIpJVAN8fyvuhptW2JMJZYaJf9m66vyQec7f47ofTNU2ma519r+QIDo4PsZV+0ITczKsWXxqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhTt6yBekn8NCcCgwQT4GcMpbAd7VC+hb3C0MvXmLnSj+5vyya
 WFHYJP1TISkY9WfPUwJZdSSBXwt8mv0PSmKLbsyvSwgPVzfNIFWk8kkS6kYdQ/Y30hjqe+phXbi
 ZjZFJzbg/ctPLX/e0TMarnodjggEc7GBguQyB75cmB1XgYS7MgqGxFGf+w8K+nhNvd6Npkws=
X-Gm-Gg: ASbGncu7xi6v814u1JUhAkKUlRxgYDm8sC6qZvv8V8Ep/18UWz6djFh34Xf3aShl2Xy
 OkpOWfQOLVJxFiv/NxlHBghq8BIp1UPLinesU61avYCsOXqtK4azC8u0lLSvQRDtG2vHM7ysa5R
 so3pxs1lzoPh2Hqmyt0HWiTFeAA/K1A6mUyy7L5VhATAVEVRioU6Qo43izPSnHqCYXMAYY4o20W
 PUUHPsUm1yBi+iumMxwjiW0v0iVzGxwou4pVp62kROqe46LrxLPtI1ZITZ13RV+ShYDBGWC+2GB
 ietYyZu0cMLJlHKRZ2X6hG/fUgOAtSrBP0QsHPELm7FJ/YyHogoNzq5zdvDqvVqvrc4cvvVX57G
 nyAH4vFRHV9gy7DQDTzsuT8C3EEyvsvgQE8GP+JHMdZA8wekt3Mo3
X-Received: by 2002:a05:622a:4a8e:b0:4c8:79b4:93a0 with SMTP id
 d75a77b69052e-4da4b1406e7mr95494411cf.47.1758894834807; 
 Fri, 26 Sep 2025 06:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOQIkyN74txiM9v6NI3108EID0DXdgO7j0P2wRzxlXTBsHtrmHH2UgL3y0BBRZ8yy0boNzTA==
X-Received: by 2002:a05:622a:4a8e:b0:4c8:79b4:93a0 with SMTP id
 d75a77b69052e-4da4b1406e7mr95493941cf.47.1758894834250; 
 Fri, 26 Sep 2025 06:53:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583173d1c08sm1814560e87.147.2025.09.26.06.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 06:53:53 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:53:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
Message-ID: <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d69af3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=bQGRJ9mVl6_deHTFyO4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GZ7R19Y2A21-NwTWOyD2wiXO0pYlJIS1
X-Proofpoint-ORIG-GUID: GZ7R19Y2A21-NwTWOyD2wiXO0pYlJIS1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX8RzzO9v52pRp
 qSgBg29uZwqNWGniWvluOQx1MNvc3HmgsmwRzs3TLausaco8w8ZDa8BDP9JnY1YItYelSfaoHN4
 nYu1o8az12wTbgiiTbnPMaP4Xe69+nIYxhPiSk7y92quiFbfzCSaO/Jb1fkLY7p2EYzbRqAXDR4
 m164dGG/Y16NBTwgxtw4JDN4BxuC3FOeNJvsi/akRN+AAXLUgPX+pp53j/DXxdxxunvWHbaBI0c
 r2yuNsk7gzfAPCjFYYDsY7UoXXY0m5HdqfchJ7QXhc42/u1QcgeV9jskWXD6QHb4V6KRf+rSXJ1
 dkWVc7ypROIyqaAAEcCubb+fKzZHB8S/8yWr9b2XJ0Ypq2Qg5J7MgdW60BoZ4Cum4gMJyiQFN5u
 4yZKZHhrTQaj0LusqxTaCM9MX41tRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> This change enables display1 clock controller.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> index c69aa2f41ce2..d4436bc473ba 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
>  	};
>  };
>  
> +&dispcc1 {
> +	status = "okay";

I think this one should be enabled by default. Unless Konrad or Bjorn
disagrees, please fix lemans.dtsi.

> +};
> +
>  &i2c11 {
>  	clock-frequency = <400000>;
>  	status = "okay";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
