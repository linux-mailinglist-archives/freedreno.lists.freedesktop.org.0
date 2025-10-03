Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F60BB7938
	for <lists+freedreno@lfdr.de>; Fri, 03 Oct 2025 18:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7731A10E94C;
	Fri,  3 Oct 2025 16:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDAabfTB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7777D10E94B
 for <freedreno@lists.freedesktop.org>; Fri,  3 Oct 2025 16:38:04 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593CBYWt017886
 for <freedreno@lists.freedesktop.org>; Fri, 3 Oct 2025 16:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PaB05ReHzVkjcgDOQJ8wCEcv
 GYDkEolJa/U3B3s4jhQ=; b=BDAabfTBHu4Qu7hHQcd4IUutsFopPzc789XbybRe
 tzimqUkbL+tppeZO0qOdF4ae7AbWNAr2ewqk7VA4DRN0VBawMYahdyLjSNZvPO5Z
 wW7YVot4zjAiwsgzl7HQ3u6gDxNHcgI//Gy3/hnKOYssKKxqixoGbog/jtwbC2hw
 p8FFXFFJuRrfRvpmEaSadBLlCN552h4+fAQUuc3+vol+H5TKYaiPXwZr/BKz1/jV
 KU2jbNZ+R+r0lM9bnAw3DEBwULi20Ndl5XVUo1ix8tKuocoxXxMiBynlsgXtwhiU
 GCwz2Zr/jlzRNlqtU/iA63FyGrk7TSpwt3VKA1grlgQ1rw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrfcw1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 03 Oct 2025 16:38:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4de36c623f6so59603001cf.3
 for <freedreno@lists.freedesktop.org>; Fri, 03 Oct 2025 09:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759509482; x=1760114282;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PaB05ReHzVkjcgDOQJ8wCEcvGYDkEolJa/U3B3s4jhQ=;
 b=rL7E5+BSDLyGs7nNcuTmwKslJEHkFBkhO+iy4SM9z17mkLhTTAX5NdLBXTekKp8qP5
 aciPU8dJ9u0SbLiQHHhksxbl0hf5k00JuMrz/1x3id/JZkNs/D1TFGda4v964ORRMaRi
 AWujXyygsCOXlXChE/qMVge7SNkAZuMMuHUpFxcLR4+nLxqQicLApexli4d3Xi37E1+e
 MvXe7b+HL1YvdXrP/LHP/k0+4z/7rkNKX1Bq7mGFGHFdY+fUqOcqChAj4DpC98dxciL/
 8NZOqOnFcKYbhCq9AcWAdNt0mvpP2afaOKXabmL2egY9gtMQjk+wKOdp9P45Fb5SvLlx
 ZBVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBUrrZ9gr0jMygeE3huF/QKlHO/I5BivyQuulf3IA/EyqZVTxFc77MrD3/PANng/pG8OfmWzxmftg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFwZl91iT0Zsjc1k+C42a9JRRqJyCYr4VXwwK2iuZ54hyGuvkI
 N/N2npGntj++p7DIlSz5bmycjfBLziVZLFPDRHjmSi2Djcf9aBMWIM51Mgw862oB9Xq2XgFSa6v
 m30RiQAg1OXwGYFioA5LunRywo/KevGAHEjrWdKCldWo71T9Yz7PjFa8bTjeoptdpLylmd3X9EW
 rVnVw=
X-Gm-Gg: ASbGncvGgPAdbv+miRABxCmTcjZb50uJbLGlMZDT5tAfPYtHruJylO12cv6WZnbme8i
 X4Uu7FR2LBUORDwiI4xYXnVZOlSgpK1sV+e8qMgHGvycboEtXsCuLNIrvaRqSjYir2l9v3WxDLC
 hnaW5Kd5/zBb8FRoteSiiQ898imLlEi+KRiaB72JTO2oPRLY4X1k+Aie22LaMauWqiRTyfdcKYS
 Pi/SYYW91tMCQudRFvd2u5dIvaJk/tREfMx1KsiFgp16B162whsew0Iwpg00pzvv5R3QLcykF4t
 wNuxiJpVx+ulalRwnvav0HNARr6DkBdxavuDZevTVrtUJPgeCGS3zVxFEBFwJPIymsrMEs8n4VZ
 pzbX0cbf9nDET82cb+3suiO0gh1EuOCRHRWIrasA+f5y2C6pQaOeBJyUzjA==
X-Received: by 2002:ac8:5a84:0:b0:4e0:33d8:c636 with SMTP id
 d75a77b69052e-4e576a80529mr50279311cf.26.1759509482177; 
 Fri, 03 Oct 2025 09:38:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSWbvfWkZQINoQDGTwKD6Xs8g7eq9/yE76D0brkwEkWdt9KSTmMQhBBhVaw7u8NS1F6T0QKg==
X-Received: by 2002:ac8:5a84:0:b0:4e0:33d8:c636 with SMTP id
 d75a77b69052e-4e576a80529mr50278691cf.26.1759509481479; 
 Fri, 03 Oct 2025 09:38:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0119e878sm1983385e87.99.2025.10.03.09.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 09:38:00 -0700 (PDT)
Date: Fri, 3 Oct 2025 19:37:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
Message-ID: <v37d36nd7ues6fp53ncrqdzvmikzjn4pf427wztzatc3pvqhvn@kpg5jrkqbfc4>
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
 <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
 <e42176e9-cac0-4142-b463-9eaf86906c46@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e42176e9-cac0-4142-b463-9eaf86906c46@linaro.org>
X-Proofpoint-ORIG-GUID: qMoVvOtAZl3mKkGWC9ZsI9o7dnoGjiFN
X-Proofpoint-GUID: qMoVvOtAZl3mKkGWC9ZsI9o7dnoGjiFN
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dffbeb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=qOohxIfdt6ZrimawmyUA:9 a=CjuIK1q_8ugA:10 a=2MHBSq50hwYA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX2700pG1+VNtG
 wLxTijATy3JRwtZUF8/mmgLL5EKP7/xYTgbvAP5YL141T7drzgr6fRB5tHpSxQMr0E2dLOro1De
 23gXKk34w5Z7zDVpkXsccfvF61VYRc/oXLDYjJ9RY//B84sKapH84gya1RlELi3QVMmOFDQSo37
 8cpPD3D+/AmeQ4BzlK3BsNxop0WDsKsyjbpNrSyZC2FomLW3Djn7lA/6xSGT4F7FWnmO1/646cB
 34azucuqr6sGIK1b98YFs/4Mirwwg/EnArDH42dRt6phbWidDCAergnn0L/QoeHphbJmbvyd1QP
 7FRIbVD/zqgNCpMEjxcKQnlxbB76561E27SHGnAh0jb6tIFQx/RHMUrqamow5vcz0J5aQYPOvbs
 j8bCeGnlsY3Uc5eBccM9YgH9xDCgxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175
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

On Fri, Oct 03, 2025 at 11:01:56AM +0200, Neil Armstrong wrote:
> On 10/3/25 03:17, Dmitry Baryshkov wrote:
> > On Thu, Oct 02, 2025 at 04:57:35PM -0700, Jessica Zhang wrote:
> > > My current email will stop working soon. Update my email address to
> > > jesszhan0024@gmail.com
> > > 
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >   MAINTAINERS | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > 
> 
> So dim complains you didn't review with the right address...
> 
> dim: ERROR: 261785a47e0b ("MAINTAINERS: Update Jessica Zhang's email address"): Mandatory Maintainer Acked-by missing., aborting
> 
> I guess it expects Dmitry Baryshkov <lumag@kernel.org>

No. It is a known limitation of dim, it expects a maintainers's review,
but there aer no maintainers for MAINTAINERS file. 

-- 
With best wishes
Dmitry
