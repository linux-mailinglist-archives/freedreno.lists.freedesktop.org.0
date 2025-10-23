Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60609C014BE
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 15:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8F310E8FF;
	Thu, 23 Oct 2025 13:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5FNKPF0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27D510E14D
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 09:52:43 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6o3RV007458
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 09:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lj4HGsR9qRam1xu/E/CQi8Qt
 OyeipH/qWlPK+yXMX3s=; b=e5FNKPF0Zf0SW+bOQun0ZKKrCe4aazHrrBYYJtZr
 CcQvJguaZm0s6DGPnNakYReyeqfAuv4cBK2SfjdMxZBF0TE8KdhPWtlX1tnGo+j/
 BWFz035c9Y/jdFQNMeyhu0LVKI/NSAQ1R0P3FbrjuX/HJoipzNRDzsOQ4zB6qp/C
 5jd7BVk53ENCamvpoqM3kjiXDnfna0NC53B66StBK+1GwJPbqHfpY4yiIi/EgEtP
 s3MU2YhUzV1yWcuiO4c6CWgqrRfKTBTTu+uMo5MmuNZS4hkqlVnI5DJf1UFcW5wm
 vPpCj04lc/8VxEWLEeWRec+E+xF2eyD/1UntRiHwStNZYA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v344800n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 09:52:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-87dfd03fb72so31349546d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 02:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761213162; x=1761817962;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lj4HGsR9qRam1xu/E/CQi8QtOyeipH/qWlPK+yXMX3s=;
 b=vfR54rODCjB0ydtCMtwbRwp6PCHWLWYiRY5liEmIRhJy9yRdU6YhQMwmKjQSAPCQCJ
 IUnOY+Kn1DKE5rXcsi4Cj1xPQjKm/lQT8VfiuSqdv40jp4fGmHQIW7PueuZK6bHvz8U/
 8zprNSOs9/FavOtSE9ncw5X15aw/kMKogTiGa00hSRHvIj9DMhsAzZt9lkOC9W4yh3k8
 3v8Vu7NRj1mO4PZLrLk8zpU3D2+KiNMc4rxcjr1USrKh/tNqEJheDCYRrVsXUuyqCACM
 47+H7fe9C9XFylrc4fcD3BargYd2KLZtYgQSZWm96Hc7u7su6MQBQfEjjPxlIKWy6s9k
 VkfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfmho/vZbouQZAVvRj8BfF0t0WtEVxc4fUyW/paciAc5ULexOul0YVdojVkbJtW08HEDPxVqckTew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGCjkXKaPhbTUi5Ub5QEONW8KepQLEGG2u1bs6O8JscqSA/Cwj
 9hbPOcaN3y35FP8LgJB3hBxS5j2DvDKTc43PVOkmljHZTD2NYN/Kg6uZkAJmBfAjgqABT0Z76TK
 HmUnEixkkEzkwf5iPMwSUJYMVC/m5IJXC2YYD9R7y+iE5EIwRbUoi4KS5dslPin7MkSY2tNw=
X-Gm-Gg: ASbGncv6Ds1hulMHPERdWO2zSQ+1OcY3dOLYAAor/Bc3eDg+27qWKjXbrQtvAs5N99C
 rfANDIIF3nbrQiUiYmrqoPMUkj6kPA13lp1W7YhecNtnmDkAkdxxlmaWGdr4xiD0/5mP0Dpfw4H
 0r53ndn+Hbfczl+9oEfhPtancTNQJOntw7wdiitQYs44PEbSzTvtEBP3OgWureXeXgdqL/cJ78x
 +JMsqu7qoVQSotfFIUYutVUmQRcyLThFkCHWxUvYf0O7VCf4vbkIgNEDGAKuP60RqdqOPs+Tkv1
 Y7/UEcTDZ76rLdIAahu6Z+Jik381Pl6McZyXq2xcXKB1Z3/75DcZebTu3W5UZgMUswd6qswT1Ns
 UGv1nP/FPZrD196vXK6pZLe5MZPVa4A8bRLelt7Yf4vNQ8ci7G+K1S4mXCUt4
X-Received: by 2002:a05:6214:2406:b0:87d:e77e:4df1 with SMTP id
 6a1803df08f44-87de77e4e55mr114575306d6.60.1761213162129; 
 Thu, 23 Oct 2025 02:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7AbIcMz4qaa9yIcpZvpwREt3p4UM9idjvFlz0HEChINWcK7/GEpAuVvvqWLIzfePwg8PadQ==
X-Received: by 2002:a05:6214:2406:b0:87d:e77e:4df1 with SMTP id
 6a1803df08f44-87de77e4e55mr114574926d6.60.1761213161613; 
 Thu, 23 Oct 2025 02:52:41 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87f9de7beafsm12276226d6.14.2025.10.23.02.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 02:52:41 -0700 (PDT)
Date: Thu, 23 Oct 2025 17:52:29 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 mripard@kernel.org, linux-kernel@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, marijn.suijten@somainline.org,
 abhinav.kumar@linux.dev, simona@ffwll.ch, devicetree@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, krzk+dt@kernel.org,
 freedreno@lists.freedesktop.org, neil.armstrong@linaro.org,
 quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org,
 lumag@kernel.org, airlied@gmail.com, sean@poorly.run,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 jonathan@marek.ca, robin.clark@oss.qualcomm.com,
 quic_khsieh@quicinc.com, conor+dt@kernel.org, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 12/12] dt-bindings: display/msm: qcom, kaanapali-mdss: Add
 Kaanapali
Message-ID: <aPn63QSJL52HmhGZ@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com>
 <176121209123.1694835.2815069098750745260.robh@kernel.org>
 <10999a80-df1a-45c5-ba1e-e64b2afeeb4f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10999a80-df1a-45c5-ba1e-e64b2afeeb4f@oss.qualcomm.com>
X-Proofpoint-GUID: XIoJAo2LDlMkVvwJTVsCmhP1F6i2DFcB
X-Proofpoint-ORIG-GUID: XIoJAo2LDlMkVvwJTVsCmhP1F6i2DFcB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX7HzRKHiGOrC/
 01+KNKhUSeuZegJPirYaT4s1uAjpRNswEgBHo1czlRrmwz7gejjXXG8iFPImiSGIxe8rGhqP2R3
 ANE0A1sVm4nZRH3r0g6EYNqBtARwWx4bpVkKyOw2ITdeR9G5qfjPfJw7L9mcW+tMJcL5641IUas
 6UYDT/IXDXlLi6O7mfzfvobcVRyWB9apGXgtY0217tjLA8h8brD7XfAUnXEZQiTGIF3DlwQnBiq
 69no/oKDPCHyokZkauBUPeB/2aLZ+4Zua6PQNtihlkj2rdxQVqDKT7wH7jhwpbzjE7zh3rBIfhC
 fISx75VXBrDNBRPYcqAiM7gQnBKTnTX4wTCCO+XH0ydVfwjvCoSjmXmEUxLtUL99bkqb06exiLY
 zioQCBp/QDATDwUEt+vyb++cfZDlhA==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f9faeb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=i8jsQQnW1KsEJaHduVgA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
X-Mailman-Approved-At: Thu, 23 Oct 2025 13:16:01 +0000
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

On Thu, Oct 23, 2025 at 11:36:42AM +0200, Konrad Dybcio wrote:
> On 10/23/25 11:34 AM, Rob Herring (Arm) wrote:
> > 
> > On Thu, 23 Oct 2025 16:17:36 +0800, yuanjie yang wrote:
> >> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>
> >> Add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> >>
> >> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >> ---
> >>  .../display/msm/qcom,kaanapali-mdss.yaml      | 298 ++++++++++++++++++
> >>  1 file changed, 298 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> >>
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dts:26:18: fatal error: dt-bindings/interconnect/qcom,kaanapali-rpmh.h: No such file or directory
> >    26 |         #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> 
> Please do what you did with the other clocks and simply refer to it
> as some vague &rpmhcc_xo_clk which doesn't actually need to be defined

Thanks for your tips, let me check and fix it.

Thanks,
Yuanjie
 

> Konrad
